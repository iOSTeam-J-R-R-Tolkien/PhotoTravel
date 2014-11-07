//
//  SingleImageViewController.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "DetailedImageViewController.h"

@interface DetailedImageViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation DetailedImageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  self.imageContainer.image = [UIImage imageNamed:@"welcome.png"];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  [self.loadingPopup showOnScreen];
  [self.loadingPopup hideFromScreen];
}

- (IBAction)imagePinch:(UIPinchGestureRecognizer *)sender {
  float scale = sender.scale;
  self.imageContainer.transform = CGAffineTransformMakeScale(scale, scale);
}

@end
