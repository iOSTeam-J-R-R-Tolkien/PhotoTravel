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
  [self.loadingPopup showOnScreen];
  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];

  UIBarButtonItem *logoutButton =
      [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                       style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(logoutButtonAction:)];
  self.navigationItem.rightBarButtonItems =
      [[NSArray alloc] initWithObjects:logoutButton, nil];

  [self _loadData];
}

- (void)logoutButtonAction:(id)sender {
  [PFUser logOut];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.loadingPopup hideFromScreen];
}

- (void)_loadData {
  if (self.userData) {
      [self userDataLoadHandler: self.userData];
  } else {
      [ProfileData loadProfileDataAsync:self];
  }
}

- (void)userDataLoadHandler:(ApplicationUser *)userData {
  self.userData = userData;

  if (self.userData.locationName) {
    self.profileLocationLable.text = self.userData.locationName;
  }

  if (self.userData.gender) {
    self.profileGenderLable.text = self.userData.gender;
  }

  if (self.userData.birthday) {
    self.profileDataOfBirthLable.text = self.userData.birthday;
  }

  if (self.userData.name) {
    self.profileNameLabel.text = self.userData.name;
  }

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

@end
