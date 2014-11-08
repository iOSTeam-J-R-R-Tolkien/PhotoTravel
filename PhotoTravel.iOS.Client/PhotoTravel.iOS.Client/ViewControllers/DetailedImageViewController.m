//
//  SingleImageViewController.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "DetailedImageViewController.h"
#import "ViewsHelper.h"

@interface DetailedImageViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation DetailedImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  [self.loadingPopup showOnScreen];
  self.imageContainer.image = [UIImage imageNamed:@"welcome.png"];
  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
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

@end
