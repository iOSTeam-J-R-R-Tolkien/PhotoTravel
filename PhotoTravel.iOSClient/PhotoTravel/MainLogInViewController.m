//
//  MainLogInViewController.m
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/5/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "MainLogInViewController.h"
#import <Parse/Parse.h>

@interface MainLogInViewController ()

@end

@implementation MainLogInViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.logInView.facebookButton.enabled = YES;

  [self.logInView
      setBackgroundColor:[UIColor
                             colorWithPatternImage:
                                 [UIImage imageNamed:@"main_background.png"]]];
  [self.logInView setLogo:[[UIImageView alloc]
                              initWithImage:[UIImage imageNamed:@"logo.png"]]];

  // Set buttons appearance
  [self.logInView.dismissButton setImage:[UIImage imageNamed:@"exit.png"]
                                forState:UIControlStateNormal];
  [self.logInView.dismissButton setImage:[UIImage imageNamed:@"exit_down.png"]
                                forState:UIControlStateHighlighted];

  [self.logInView.facebookButton setImage:nil forState:UIControlStateNormal];
  [self.logInView.facebookButton setImage:nil
                                 forState:UIControlStateHighlighted];
  [self.logInView.facebookButton
      setBackgroundImage:[UIImage imageNamed:@"facebook_down.png"]
                forState:UIControlStateHighlighted];
  [self.logInView.facebookButton
      setBackgroundImage:[UIImage imageNamed:@"facebook.png"]
                forState:UIControlStateNormal];
  [self.logInView.facebookButton setTitle:@"" forState:UIControlStateNormal];
  [self.logInView.facebookButton setTitle:@""
                                 forState:UIControlStateHighlighted];

  [self.logInView.twitterButton setImage:nil forState:UIControlStateNormal];
  [self.logInView.twitterButton setImage:nil
                                forState:UIControlStateHighlighted];
  [self.logInView.twitterButton
      setBackgroundImage:[UIImage imageNamed:@"twitter.png"]
                forState:UIControlStateNormal];
  [self.logInView.twitterButton
      setBackgroundImage:[UIImage imageNamed:@"twitter_down.png"]
                forState:UIControlStateHighlighted];
  [self.logInView.twitterButton setTitle:@"" forState:UIControlStateNormal];
  [self.logInView.twitterButton setTitle:@""
                                forState:UIControlStateHighlighted];

  [self.logInView.signUpButton
      setBackgroundImage:[UIImage imageNamed:@"signup.png"]
                forState:UIControlStateNormal];
  [self.logInView.signUpButton
      setBackgroundImage:[UIImage imageNamed:@"signup_down.png"]
                forState:UIControlStateHighlighted];
  [self.logInView.signUpButton setTitle:@"" forState:UIControlStateNormal];
  [self.logInView.signUpButton setTitle:@"" forState:UIControlStateHighlighted];

  // Add login field background
  self.fieldsBackground = [[UIImageView alloc]
      initWithImage:[UIImage imageNamed:@"background.png"]];
  [self.logInView insertSubview:self.fieldsBackground atIndex:1];

  // Remove text shadow
  CALayer *layer = self.logInView.usernameField.layer;
  layer.shadowOpacity = 0.0;
  layer = self.logInView.passwordField.layer;
  layer.shadowOpacity = 0.0;

  // Set field text color
  [self.logInView.usernameField
      setTextColor:[UIColor colorWithRed:135.0f / 255.0f
                                   green:118.0f / 255.0f
                                    blue:92.0f / 255.0f
                                   alpha:1.0]];
  [self.logInView.passwordField
      setTextColor:[UIColor colorWithRed:135.0f / 255.0f
                                   green:118.0f / 255.0f
                                    blue:92.0f / 255.0f
                                   alpha:1.0]];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
