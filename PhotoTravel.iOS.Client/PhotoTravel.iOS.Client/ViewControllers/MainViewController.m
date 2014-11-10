#import "MainViewController.h"

#include <math.h>

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "Landmark.h"
#import "Post.h"

#import "UsersData.h"
#import "LandmarksData.h"
#import "PostsData.h"
#import "StatisticsData.h"

#import "ViewsHelper.h"
#import "DataHelper.h"

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "LoadingScreenViewController.h"
#import "LandmarkWithLastPostUITableViewCell.h"
#import "DetailedImageViewController.h"
#import "LandmarkTableViewController.h"
#import "MusicManagerController.h"

@interface MainViewController ()
@property(strong, nonatomic) MusicManagerController *musicController;
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation MainViewController

static NSString *identifier = @"LandmarkWithLastPostUITableViewCell";

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [StatisticsData updateStatisticsWithPostsCount:[NSNumber numberWithInt:5]
                               andLandmarksCount:[NSNumber numberWithInt:6]
                                   andUsersCount:[NSNumber numberWithInt:7]];
  Statistics *todayStatistics = [StatisticsData getTodayStatistics];

  self.cachedImages = [[NSMutableDictionary alloc] init];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  self.musicController = [[MusicManagerController alloc] init];

  [self.musicController tryPlayMusic];

  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];

  UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
  [self.postsTableView registerNib:nib forCellReuseIdentifier:identifier];
  self.postsTableView.delegate = self;
  self.rowDataArray = [[NSMutableArray alloc] init];
  [self.postsTableView setDataSource:self];
  [self.postsTableView setBackgroundColor:[UIColor colorWithRed:0.960784
                                                          green:0.960784
                                                           blue:0.960784
                                                          alpha:0.1]];
    [LandmarksData getLastPostsAsync:5 for:self];
}

- (IBAction)addLandmark:(id)sender {
}

- (void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData {
  self.rowDataArray = landmarkData;
  [self.postsTableView reloadData];
}

- (IBAction)addPostToLastAddedLandmark:(id)sender {
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.loadingPopup showOnScreen];

  PFUser *currentUser = [PFUser currentUser];
  if (currentUser != nil) {
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection,
                                          id result, NSError *error) {
        if (!error) {
          ApplicationUser *appUser =
              [DataHelper parseApplicationUserFromQuery:result];

          [self loadBarItemsForUserWithName:appUser.name andId:appUser.userId];
          [self.loadingPopup hideFromScreen];
        }
    }];
  } else {
    // Popup the facebook login
    LoginViewController *login = [[LoginViewController alloc] init];
    login.fields = PFLogInFieldsFacebook;
    login.delegate = self;
    login.signUpController.delegate = self;
    [self presentViewController:login animated:YES completion:nil];
  }
}

- (void)myInfoBtn {
  [self performSegueWithIdentifier:@"myInfoSegue" sender:self];
}

- (void)logInViewController:(PFLogInViewController *)logInController
               didLogInUser:(PFUser *)user {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)logInViewControllerDidCancelLogIn:
            (PFLogInViewController *)logInController {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController
               didSignUpUser:(PFUser *)user {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpViewControllerDidCancelSignUp:
            (PFSignUpViewController *)signUpController {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadBarItemsForUserWithName:(NSString *)name andId:(NSString *)userId {
    [UsersData getProfileImageForProfileIdAsync:userId for:self andLoadHandler:^(UIImage *profileImage) {
    CGFloat oImageWidth = profileImage.size.width;
    CGFloat oImageHeight = profileImage.size.height;
    // Draw the original image at the origin
    CGRect oRect = CGRectMake(0, 0, oImageWidth, oImageHeight);
    [profileImage drawInRect:oRect];

    // Set the newRect to half the size of the original image
    CGRect newRect = CGRectMake(0, 0, oImageWidth / 2, oImageHeight / 2);
    UIImage *newImage = [ViewsHelper circularScaleNCrop:profileImage
                                     withRectDimensions:newRect];

    // create new button
    UIButton *profileImageButton = [[UIButton alloc] init];
    // set frame
    profileImageButton.frame = CGRectMake(0, 0, 40, 40);
    // set background image
    [profileImageButton setBackgroundImage:newImage
                                  forState:UIControlStateNormal];

    UIBarButtonItem *nameButton =
        [[UIBarButtonItem alloc] initWithTitle:name
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(myInfoBtn)];

    UIBarButtonItem *profileImageButtonItem =
        [[UIBarButtonItem alloc] initWithCustomView:profileImageButton];

    self.navigationItem.rightBarButtonItems = [[NSArray alloc]
        initWithObjects:profileImageButtonItem, nameButton, nil];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [self.rowDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"LandmarkWithLastPostUITableViewCell";

  LandmarkWithLastPostUITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [self.postsTableView dequeueReusableCellWithIdentifier:identifier
                                                     forIndexPath:indexPath];
  }

  Landmark *landmark = (Landmark *)self.rowDataArray[indexPath.row];
  Post *post = (Post *)landmark.posts[0];
  NSNumber *postId = post.pfObject.objectId;

  UIImage *imageToLoad = [self.cachedImages objectForKey:postId];
  if (!imageToLoad) {
    [PostsData
        loadImageFromPostAsync:post.pfObject for:self
                andLoadHandler:^(UIImage *image) {
      [self.cachedImages setObject:image forKey:postId];

      [ViewsHelper changeImageSourceWithAnimation:image
                                    forTargetView:cell.postImageView];
                }];
  } else {
    [ViewsHelper changeImageSourceWithAnimation:imageToLoad
                                  forTargetView:cell.postImageView];
  }

  cell.landmarkLabel.text = landmark.name;
  cell.lastPostLable.text = post.name;
  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  self.selectedRow = indexPath.row;
  [self performSegueWithIdentifier:@"myLandmarkSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"myLandmarkSegue"]) {
    LandmarkTableViewController *vc = [segue destinationViewController];

    Landmark *landmark = (Landmark *)self.rowDataArray[self.selectedRow];
    vc.landmarkData = landmark;
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  self.cachedImages = nil;
}

- (void)noConnectionHandler {
  UIAlertView *alert =
      [[UIAlertView alloc] initWithTitle:@"No connection"
                                 message:@"Please ensure your WiFi or mobile "
                                 @"data connection is enabled."
                                delegate:self
                       cancelButtonTitle:@"Ok"
                       otherButtonTitles:nil];
  [alert show];
}

@end
