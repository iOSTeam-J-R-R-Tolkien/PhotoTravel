<<<<<<< HEAD
//
//  LoginViewController.m
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/5/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "LoginViewController.h"

// This is defined in Math.h
#define M_PI 3.14159265358979323846264338327950288 /* pi */
// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface LoginViewController ()
@property(retain, nonatomic) UIImageView *logoImage;
@end

@implementation LoginViewController
@synthesize logoImage;

- (void)viewDidLoad {

  [super viewDidLoad];

  self.view.backgroundColor = [UIColor lightGrayColor];

  logoImage =
      [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];

  self.logInView.logo = logoImage;
}

- (void)viewDidAppear:(BOOL)animated {
    [self runSpinAnimationOnView:logoImage duration:8 rotations:1 repeat:100];
}

- (void)runSpinAnimationOnView:(UIView *)view
                      duration:(CGFloat)duration
                     rotations:(CGFloat)rotations
                        repeat:(float)repeat;
{
  CABasicAnimation *rotationAnimation;
  rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
  rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0 /* full rotation*/ * rotations * duration];
  rotationAnimation.duration = duration;
    rotationAnimation.speed = 0.7;
  rotationAnimation.cumulative = YES;
  rotationAnimation.repeatCount = repeat;

  CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  scaleAnimation.duration = 1.0f;
  scaleAnimation.timingFunction = [CAMediaTimingFunction
      functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
  scaleAnimation.toValue = [NSNumber numberWithFloat:1.3f];
  scaleAnimation.repeatCount = repeat;

  [view.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
  [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
=======
/**
 * Copyright (c) 2014, Parse, LLC. All rights reserved.
 *
 * You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
 * copy, modify, and distribute this software in source code or binary form for use
 * in connection with the web services and APIs provided by Parse.

 * As with any software that integrates with the Parse platform, your use of
 * this software is subject to the Parse Terms of Service
 * [https://www.parse.com/about/terms]. This copyright notice shall be
 * included in all copies or substantial portions of the software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#import "LoginViewController.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "UserDetailsViewController.h"

@implementation LoginViewController

#pragma mark -
#pragma mark Init

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Facebook Profile";
    }
    return self;
}

#pragma mark -
#pragma mark UIViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self _presentUserDetailsViewControllerAnimated:NO];
    }
    
}

#pragma mark -
#pragma mark Login

- (IBAction)loginButtonTouchHandler:(id)sender  {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];

    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [_activityIndicator stopAnimating]; // Hide loading indicator

        if (!user) {
            NSString *errorMessage = nil;
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                errorMessage = [error localizedDescription];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
        } else {
            if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
            } else {
                NSLog(@"User with facebook logged in!");
            }
            [self _presentUserDetailsViewControllerAnimated:YES];
        }
    }];

    //[_activityIndicator startAnimating]; // Show loading indicator until login is finished
}

#pragma mark -
#pragma mark UserDetailsViewController

- (void)_presentUserDetailsViewControllerAnimated:(BOOL)animated {
    UserDetailsViewController *detailsViewController = [[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:detailsViewController animated:animated];
>>>>>>> FETCH_HEAD
}

@end
