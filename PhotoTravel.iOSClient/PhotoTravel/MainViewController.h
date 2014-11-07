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

@interface MainViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIImage *profileImage;
@property (strong, nonatomic) LoadingScreenViewController *popViewController;

@end
