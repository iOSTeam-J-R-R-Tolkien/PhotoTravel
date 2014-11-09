//
//  LandmarkTableViewController.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "LandmarkTableViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "ApplicationUser.h"
#import "LoadingScreenViewController.h"
#import "ViewsHelper.h"

#import "Landmark.h"
#import "Post.h"
#import "LandmarkData.h"

#import "PostsData.h"
#import "ViewsHelper.h"

@interface LandmarkTableViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation LandmarkTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
    [self.loadingPopup showOnScreen];
    //    [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
    
    UIBarButtonItem *logoutButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(logoutButtonAction:)];
    self.navigationItem.rightBarButtonItems =
    [[NSArray alloc] initWithObjects:logoutButton, nil];
    //    [LandmarkData getLastPostsAsync:5 for:self];
}

- (void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData {
    //    self.rowDataArray = landmarkData;
    //    [self.postsTableView reloadData];
}

- (void)logoutButtonAction:(id)sender {
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.loadingPopup hideFromScreen];
}

//- (NSInteger)tableView:(UITableView *)tableView
// numberOfRowsInSection:(NSInteger)section {
//    return [self.landmarkData count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView
//         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *CellIdentifier = @"LandmarkWithLastPostUITableViewCell";
//    
//    LandmarkWithLastPostUITableViewCell *cell =
//    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [self.postsTableView dequeueReusableCellWithIdentifier:identifier
//                                                         forIndexPath:indexPath];
//    }
//    
//    //    Landmark *landmark = (Landmark *)self.rowDataArray[indexPath.row];
//    //    Post *post = (Post *)self.landmarkData[indexPath.row].posts[0];
//    Post *post = (Post *)self.landmarkData.posts[0];
//    [PostsData loadImageFromPostAsync:post.pfObject
//                       andLoadHandler:^(UIImage *image) {
//                           [ViewsHelper changeImageSourceWithAnimation:image forTargetView:cell.postImageView];
//                       }];
//    
//    cell.landmarkLabel.text = landmark.name;
//    cell.lastPostLable.text = post.name;
//    return cell;
//}

@end
