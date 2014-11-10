//
//  MyInfoViewController.h
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationUser.h"
#import "ProfileDataProtocol.h"

@interface MyInfoViewController : UIViewController <ProfileDataProtocol, UITableViewDataSource>

@property(weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property(weak, nonatomic) IBOutlet UITextField *profileNameLabel;

@property (weak, nonatomic) IBOutlet UITableView *viewTableProfileData;

@property(strong, nonatomic) ApplicationUser *userData;
@property(strong, nonatomic) NSMutableDictionary *userProfileRowsData;
@property(strong, nonatomic) NSArray *userProfileRowsDataKeys;

- (void)userDataLoadHandler:(ApplicationUser *)userData;
- (void)profileImageLoadHandler:(UIImage *)profileImage;
- (void)noConnectionHandler;
@end
