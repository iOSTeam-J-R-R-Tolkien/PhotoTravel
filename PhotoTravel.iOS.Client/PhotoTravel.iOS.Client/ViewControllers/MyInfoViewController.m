#import "MyInfoViewController.h"
#import "ViewsHelper.h"
#import "LoadingScreenViewController.h"
#import "ProfileData.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "DataHelper.h"
#import "ApplicationUser.h"
#import "ProfileData.h"

@interface MyInfoViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation MyInfoViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];

  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];

  UIBarButtonItem *logoutButton =
      [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                       style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(logoutButtonAction:)];
  self.navigationItem.rightBarButtonItems =
      [[NSArray alloc] initWithObjects:logoutButton, nil];
  self.userProfileRowsData = [[NSMutableDictionary alloc] init];
  [self.viewTableProfileData setDataSource:self];
  [self.viewTableProfileData setBackgroundColor:[UIColor clearColor]];
}

- (void)logoutButtonAction:(id)sender {
  [PFUser logOut];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.loadingPopup showOnScreen];
  [self _loadData];
}

- (void)_loadData {
  if (self.userData) {
    [self userDataLoadHandler:self.userData];
  } else {
    [ProfileData loadProfileDataAsync:self];
  }
}

- (void)userDataLoadHandler:(ApplicationUser *)userData {
  self.userData = userData;

  if (self.userData.name) {
    self.profileNameLabel.text = self.userData.name;
  }

  if (self.userData.gender) {
    [self.userProfileRowsData setObject:self.userData.gender forKey:@"Gender"];
  }

  if (self.userData.birthday) {
    [self.userProfileRowsData setObject:self.userData.birthday
                                 forKey:@"Birthday"];
  }

  if (self.userData.locationName) {
    [self.userProfileRowsData setObject:self.userData.locationName
                                 forKey:@"Location"];
  }

  self.userProfileRowsDataKeys = [self.userProfileRowsData allKeys];
  [self.viewTableProfileData reloadData];
  [self.loadingPopup hideFromScreen];

  [ProfileData loadProfileImageAsync:self forUserId:self.userData.userId];
}

- (void)profileImageLoadHandler:(UIImage *)profileImage {
  CGFloat oImageWidth = profileImage.size.width;
  CGFloat oImageHeight = profileImage.size.height;
  // Draw the original image at the origin
  CGRect oRect = CGRectMake(0, 0, oImageWidth / 2, oImageHeight / 2);
  [profileImage drawInRect:oRect];

  // Set the newRect to half the size of the original image
  CGRect newRect = CGRectMake(0, 0, oImageWidth, oImageHeight);
  UIImage *circleImage =
      [ViewsHelper circularScaleNCrop:profileImage withRectDimensions:newRect];

  self.profileImageView.image = circleImage;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return [self.userProfileRowsData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";

  NSString *description = (self.userProfileRowsDataKeys)[indexPath.row];
  NSString *labelValue = [self.userProfileRowsData objectForKey:description];

  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier];
  }

  UILabel *descLabel = (UILabel *)[cell viewWithTag:100];
  UILabel *valueLabel = (UILabel *)[cell viewWithTag:101];

  descLabel.text = description;
  valueLabel.text = labelValue;

  return cell;
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
