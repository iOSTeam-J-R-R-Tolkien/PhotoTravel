//
//  LoginViewController.m
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/3/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "LoginViewController.h"
#import "LoadingScreenViewController.h"
#import "AppDelegate.h"
#import "MusicManagerController.h"

@interface MainViewController ()
@property(strong, nonatomic) MusicManagerController *musicController;
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // add button
  //    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc]
  //    initWithTitle:@"MY INFO"
  //                                                                      style:UIBarButtonItemStylePlain
  //                                                                     target:self
  //                                                                     action:@selector(myInfoBtn)];
  //                                                                     //@selector(refreshPropertyList:)
  //    anotherButton.image = profileImage;
  //    [anotherButton backgroundImageForState:profileImage
  //    forState:UIControlStateHighlighted];
  //    anotherButton.image = profileImage;
  //        self.navigationItem.rightBarButtonItem = anotherButton;
  //[anotherButton release];

  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];

  self.musicController = [[MusicManagerController alloc] init];
  [self.musicController tryPlayMusic];
}

- (void)viewDidAppear:(BOOL)animated {
  [self.loadingPopup showOnScreen];
  [super viewDidAppear:animated];

  PFUser *currentUser = [PFUser currentUser];
  if (currentUser != nil) {
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection,
                                          id result, NSError *error) {
        if (!error) {
          // result is a dictionary with the user's Facebook data
          NSDictionary *userData = (NSDictionary *)result;
          NSString *name = userData[@"name"];

          UIBarButtonItem *anotherButton =
              [[UIBarButtonItem alloc] initWithTitle:name
                                               style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(myInfoBtn)];
          self.navigationItem.rightBarButtonItem = anotherButton;
          [self.loadingPopup hideFromScreen];
        }
    }];
  } else {
    // Popup the facebook login
    LoginViewController *login = [[LoginViewController alloc] init];
    login.fields = PFLogInFieldsFacebook;
    login.delegate = self;
    login.signUpController.delegate = self;
    [self presentViewController:login animated:YES completion:nil];
  }
}
- (void)myInfoBtn {
  [self performSegueWithIdentifier:@"myInfoSegue" sender:self];
}

- (void)logInViewController:(PFLogInViewController *)logInController
               didLogInUser:(PFUser *)user {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)logInViewControllerDidCancelLogIn:
            (PFLogInViewController *)logInController {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController
               didSignUpUser:(PFUser *)user {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpViewControllerDidCancelSignUp:
            (PFSignUpViewController *)signUpController {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (IBAction)buttonToImageView:(UIButton *)sender {
  [self performSegueWithIdentifier:@"singleImageView" sender:self];
}
@end
