#import "LandmarkTableViewController.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "ApplicationUser.h"
#import "Landmark.h"

#import "LandmarksData.h"
#import "PostsData.h"

#import "ViewsHelper.h"
#import "ViewsHelper.h"

#import "LoadingScreenViewController.h"
#import "LandmarkUITableViewCell.h"
#import "DetailedImageViewController.h"

@interface LandmarkTableViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation LandmarkTableViewController

static NSString *identifier = @"LandmarkUITableViewCell";

- (void)viewDidLoad {
  [super viewDidLoad];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  [self.loadingPopup showOnScreen];
  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
     [LandmarksData getLandmarkWithPostsAsync:self.landmarkData for:self];

     // cust table init
     UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
     [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
     [self.tableView setDataSource:self];
     UIView *rootView = [[nib instantiateWithOwner:nil options:nil] lastObject];
     self.tableView.estimatedRowHeight = rootView.frame.size.height;
     self.tableView.rowHeight = UITableViewAutomaticDimension;
     self.tableView.delegate = self;
     [self.tableView
         setBackgroundView:[[UIImageView alloc]
                               initWithImage:[UIImage imageNamed:@"bg.jpg"]]];
     [self.tableView setBackgroundColor:[UIColor colorWithRed:0.960784
                                                        green:0.960784
                                                         blue:0.960784
                                                        alpha:0.1]];
}

- (void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData {
  //    self.rowDataArray = landmarkData;
  //    [self.postsTableView reloadData];
}

- (void)logoutButtonAction:(id)sender {
  [PFUser logOut];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.loadingPopup hideFromScreen];
}

- (void)landmarkWithPostsHander:(Landmark *)landmarkData {
  self.landmarkData = landmarkData;
  [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [self.landmarkData.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  LandmarkUITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:identifier];

  Post *post = self.landmarkData.posts[indexPath.row];
    [PostsData loadImageFromPostAsync:post.pfObject for:self
                       andLoadHandler:^(UIImage *image) {
    [ViewsHelper changeImageSourceWithAnimation:image
                                  forTargetView:cell.postImageView];
                       }];

  cell.postNameLable.text = post.name;
  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
  self.selectedRow = indexPath.row;
  [self performSegueWithIdentifier:@"singleImageView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"singleImageView"]) {
    DetailedImageViewController *galleryController =
        (DetailedImageViewController *)[segue destinationViewController];
    galleryController.landmark = self.landmarkData;
    galleryController.postIndex = 0;
  }
}

@end
