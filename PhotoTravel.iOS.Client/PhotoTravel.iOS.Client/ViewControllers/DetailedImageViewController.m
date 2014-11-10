//
//  SingleImageViewController.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "DetailedImageViewController.h"
#import "ViewsHelper.h"
#import "LandmarkData.h"
#import "Post.h"
#import "PostsData.h"

@interface DetailedImageViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation DetailedImageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  [self.loadingPopup showOnScreen];
  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
    [LandmarkData getLandmarkWithPostsAsync:self.landmark for:self];

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(nextImageHandler:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(previousImageHandler:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  [self.loadingPopup hideFromScreen];
}

- (IBAction)imagePinch:(UIPinchGestureRecognizer *)sender {
  float scale = sender.scale;
  self.imageContainer.transform = CGAffineTransformMakeScale(scale, scale);
}

- (IBAction)imageTap:(UITapGestureRecognizer *)sender {
  self.imageContainer.transform = CGAffineTransformIdentity;
}

- (IBAction)nextImageHandler:(id)sender {
  if (self.postIndex < [self.landmark.posts count] - 1) {
    self.postIndex++;
  } else {
    self.postIndex = 0;
  }

  [self reloadImage];
}

- (IBAction)previousImageHandler:(id)sender {
  if (self.postIndex > 0) {
    self.postIndex--;
  } else {
    self.postIndex = [self.landmark.posts count] - 1;
  }

  [self reloadImage];
}

- (void)landmarkWithPostsHander:(Landmark *)landmarkData {
  self.landmark = landmarkData;
  [self reloadImage];
}

- (void)reloadImage {
  Post *post = (Post *)self.landmark.posts[self.postIndex];
  NSNumber *postId = post.pfObject.objectId;

  UIImage *imageToLoad = [self.cachedImages objectForKey:postId];
  if (!imageToLoad) {
    [PostsData
        loadImageFromPostAsync:post.pfObject
                andLoadHandler:^(UIImage *image) {
                    [self.cachedImages setObject:image forKey:postId];
                    [ViewsHelper
                        changeImageSourceWithAnimation:image
                                         forTargetView:self.imageContainer];
                }];
  } else {
    [ViewsHelper changeImageSourceWithAnimation:imageToLoad
                                  forTargetView:self.imageContainer];
  }
}

@end
