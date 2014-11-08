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
    
    [self _loadData];
}

- (void)logoutButtonAction:(id)sender {
    // Logout
    [PFUser logOut];
    // return to nav.root
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];    
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


- (void)_loadData {
    if ([PFUser currentUser]) {
        [self _updateProfileData];
    }
    
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            
            
            NSMutableDictionary *userProfile = [NSMutableDictionary dictionaryWithCapacity:7];
            
            if (facebookID) {
                userProfile[@"facebookId"] = facebookID;
            }
            
            NSString *name = userData[@"name"];
            if (name) {
                userProfile[@"name"] = name;
            }
            
            NSString *location = userData[@"location"][@"name"];
            if (location) {
                userProfile[@"location"] = location;
            }
            
            NSString *gender = userData[@"gender"];
            if (gender) {
                userProfile[@"gender"] = gender;
            }
            
            NSString *birthday = userData[@"birthday"];
            if (birthday) {
                userProfile[@"birthday"] = birthday;
            }
            
            NSString *relationshipStatus = userData[@"relationship_status"];
            if (relationshipStatus) {
                userProfile[@"relationship"] = relationshipStatus;
            }
            
            userProfile[@"pictureURL"] = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID];
            
            [[PFUser currentUser] setObject:userProfile forKey:@"profile"];
            [[PFUser currentUser] saveInBackground];
            
            [self _updateProfileData];
        } else if ([[[[error userInfo] objectForKey:@"error"] objectForKey:@"type"]
                    isEqualToString: @"OAuthException"]) {
            NSLog(@"The facebook session was invalidated");
            [self logoutButtonAction:nil];
        } else {
            NSLog(@"Some other error: %@", error);
        }
    }];
}


- (void)_updateProfileData {
    NSString *location = [PFUser currentUser][@"profile"][@"location"];
    if (location) {
        self.profileLocationLable.text = location;
    }
    
    NSString *gender = [PFUser currentUser][@"profile"][@"gender"];
    if (gender) {
        self.profileGenderLable.text = gender;
    }
    
    NSString *birthday = [PFUser currentUser][@"profile"][@"birthday"];
    if (birthday) {
        self.profileDataOfBirthLable.text = birthday;
    }
    
    NSString *name = [PFUser currentUser][@"profile"][@"name"];
    if (name) {
        self.profileNameLabel.text = name;
    }
    
    NSString *userProfilePhotoURLString = [PFUser currentUser][@"profile"][@"pictureURL"];
    if (userProfilePhotoURLString) {
        NSURL *pictureURL = [NSURL URLWithString:userProfilePhotoURLString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                   if (connectionError == nil && data != nil) {
                                       self.profileImageView.image = [UIImage imageWithData:data];
                                   } else {
                                       NSLog(@"Failed to load profile photo.");
                                   }
                               }];
    }
}

@end
