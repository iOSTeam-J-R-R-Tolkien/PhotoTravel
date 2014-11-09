//
//  LoginViewController.h
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/3/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>
#import "LoadingScreenViewController.h"
#import "LandmarkDataProtocol.h"

@interface MainViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITableViewDataSource, LandmarkDataProtocol>

@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property(nonatomic, strong) NSMutableDictionary *postsImages;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIImage *profileImage;
@property (weak, nonatomic) IBOutlet UITableView *postsTableView;

- (IBAction)buttonToImageView:(UIButton *)sender;
- (IBAction)addPostToLastAddedLandmark:(id)sender;

-(void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData;

@end
