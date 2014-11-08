//
//  MyInfoViewController.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "MyInfoViewController.h"
#import "ViewsHelper.h"
#import "LoadingScreenViewController.h"
#import "ProfileData.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface MyInfoViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  [self.loadingPopup showOnScreen];
  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];

  UIBarButtonItem *logoutButton =
      [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                       style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(logoutButtonAction:)];
  self.navigationItem.rightBarButtonItems =
      [[NSArray alloc] initWithObjects:logoutButton, nil];
}

- (void)logoutButtonAction:(id)sender {
  // Logout
  [PFUser logOut];
  // return to nav.root
  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  self.profileNameLabel.text = @"Some realy realy long name";
  [self loadProfileImage:@"1378763022415160"];

  [self.loadingPopup hideFromScreen];
}

- (void)loadProfileImage:(NSString *)profileId {
  UIImage *profileImage = [ProfileData getProfileImageForProfileId:profileId];
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

@end
