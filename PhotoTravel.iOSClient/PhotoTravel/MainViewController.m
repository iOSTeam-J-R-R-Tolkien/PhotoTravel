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

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  if ([PFUser currentUser]) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LoggedIn"
                                                    message:@"asddd"
                                                   delegate:nil
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil, nil];
    [alert show];
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
    //add button
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"MY INFO"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(myInfoBtn)]; //@selector(refreshPropertyList:)
    //    anotherButton.image = profileImage;
//    [anotherButton backgroundImageForState:profileImage forState:UIControlStateHighlighted];
//    anotherButton.image = profileImage;
        self.navigationItem.rightBarButtonItem = anotherButton;
    //[anotherButton release];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
    
    if ([PFUser currentUser]) {
        PFUser *user =[PFUser currentUser];
        
        int sdfsdf=34;
//        if (!user) {
//            NSString *errorMessage = nil;
//            if (!error) {
//                NSLog(@"Uh oh. The user cancelled the Facebook login.");
//                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
//            } else {
//                NSLog(@"Uh oh. An error occurred: %@", error);
//                errorMessage = [error localizedDescription];
//            }
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
//                                                            message:errorMessage
//                                                           delegate:nil
//                                                  cancelButtonTitle:nil
//                                                  otherButtonTitles:@"Dismiss", nil];
//            [alert show];
//        } else {
//            if (user.isNew) {
//                NSLog(@"User with facebook signed up and logged in!");
//            } else {
//                NSLog(@"User with facebook logged in!");
//            }
//            [self _presentUserDetailsViewControllerAnimated:YES];
//        }
    }
    else{
        LoginViewController *login = [[LoginViewController alloc] init];
        login.fields = PFLogInFieldsFacebook;
        login.delegate = self;
        login.signUpController.delegate = self;
        [self presentViewController:login animated:YES completion:nil];
    }
  
}
-(void)myInfoBtn {
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
  // Dispose of any resources that can be recreated.
}



@end
