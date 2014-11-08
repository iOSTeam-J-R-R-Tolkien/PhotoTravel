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
#import "ViewsHelper.h"
#include <math.h>
#include "ProfileData.h"
#import "LandmarkWithLastPostUITableViewCell.h"
#import "DataHelper.h"

@interface MainViewController ()
@property(strong, nonatomic) MusicManagerController *musicController;
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation MainViewController

static NSString *identifier = @"LandmarkWithLastPostUITableViewCell";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
    [self.loadingPopup showOnScreen];
    
    self.musicController = [[MusicManagerController alloc] init];
    [self.musicController tryPlayMusic];
    [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
    
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self.postsTableView registerNib:nib forCellReuseIdentifier:identifier];
    _rowDataArray = @[ @"tab1", @"tab2", @"tab3", @"tab4" ];
    [self.postsTableView setDataSource:self];
    [self.postsTableView setBackgroundColor:[UIColor colorWithRed:0.960784
                                                            green:0.960784
                                                             blue:0.960784
                                                            alpha:0.1]];
}
- (IBAction)addLandmark:(id)sender {
    
}
- (IBAction)addPostToLastAddedLandmark:(id)sender {
    //Find all posts
//    PFUser *user = [PFUser currentUser];
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"Landmark"];
//	    [query wher;
//    id *usersPosts = [query findObjects]
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser != nil) {
        FBRequest *request = [FBRequest requestForMe];
        [request startWithCompletionHandler:^(FBRequestConnection *connection,
                                              id result, NSError *error) {
            if (!error) {
                ApplicationUser *appUser = [DataHelper parseApplicationUserFromQuery:result];
                
                [self loadBarItemsForUserWithName:appUser.name andId:appUser.userId];
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

- (UIButton *)profileImageToBarButton:(NSString *)userId {
    UIImage *profileImage = [ProfileData getProfileImageForProfileId:userId];
    
    CGFloat oImageWidth = profileImage.size.width;
    CGFloat oImageHeight = profileImage.size.height;
    // Draw the original image at the origin
    CGRect oRect = CGRectMake(0, 0, oImageWidth, oImageHeight);
    [profileImage drawInRect:oRect];
    
    // Set the newRect to half the size of the original image
    CGRect newRect = CGRectMake(0, 0, oImageWidth / 2, oImageHeight / 2);
    UIImage *newImage =
    [ViewsHelper circularScaleNCrop:profileImage withRectDimensions:newRect];
    
    // create new button
    UIButton *profileImageButton = [[UIButton alloc] init];
    // set frame
    profileImageButton.frame = CGRectMake(0, 0, 40, 40);
    // set background image
    [profileImageButton setBackgroundImage:newImage
                                  forState:UIControlStateNormal];
    return profileImageButton;
}

- (void)loadBarItemsForUserWithName:(NSString *)name andId:(NSString *)userId {
    UIBarButtonItem *nameButton =
    [[UIBarButtonItem alloc] initWithTitle:name
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(myInfoBtn)];
    
    UIBarButtonItem *profileImageButtonItem = [[UIBarButtonItem alloc]
                                               initWithCustomView:[self profileImageToBarButton:userId]];
    
    self.navigationItem.rightBarButtonItems =
    [[NSArray alloc] initWithObjects:profileImageButtonItem, nameButton, nil];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.rowDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LandmarkWithLastPostUITableViewCell *cell =
    [self.postsTableView dequeueReusableCellWithIdentifier:identifier
                                              forIndexPath:indexPath];
    cell.landmarkLabel.text = self.rowDataArray[indexPath.row];
    
    return cell;
}

@end