//
//  LoadingScreenViewController.m
//  PhotoTravel
//
//  Created by Pesho on 11/6/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "LoadingScreenViewController.h"

#define M_PI 3.14159265358979323846264338327950288 /* pi */

// Our conversion definition

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface LoadingScreenViewController ()

@end

@implementation LoadingScreenViewController

+ (instancetype)initWithParentView:(UIViewController *)parentViewController {
  LoadingScreenViewController *instance =
      [[LoadingScreenViewController alloc] init];
  instance.parentViewController = parentViewController;

  return instance;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  [self runSpinAnimationOnView:self.loadingImage
                      duration:8
                     rotations:1
                        repeat:100];
}

- (void)runSpinAnimationOnView:(UIView *)view
                      duration:(CGFloat)duration
                     rotations:(CGFloat)rotations
                        repeat:(float)repeat;

{

  CABasicAnimation *rotationAnimation;

  rotationAnimation =
      [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];

  rotationAnimation.toValue = [NSNumber
      numberWithFloat:M_PI * 2.0 /* full rotation*/ * rotations * duration];

  rotationAnimation.duration = duration;

  rotationAnimation.speed = 0.7;

  rotationAnimation.cumulative = YES;

  rotationAnimation.repeatCount = repeat;

  CABasicAnimation *scaleAnimation =
      [CABasicAnimation animationWithKeyPath:@"transform.scale"];

  scaleAnimation.duration = 1.0f;

  scaleAnimation.timingFunction = [CAMediaTimingFunction

      functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

  scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0f];

  scaleAnimation.toValue = [NSNumber numberWithFloat:1.3f];

  scaleAnimation.repeatCount = repeat;

  [view.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];

  [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)showOnScreen {
  if (self.parentViewController != nil) {
    [UIView transitionWithView:self.parentViewController.view
                      duration:0.5
                       options:UIViewAnimationOptionShowHideTransitionViews
                    animations:^{
                        [self.parentViewController.view addSubview:self.view];
                        [self.parentViewController addChildViewController:self];
                    }
                    completion:nil];
  }
}

- (void)hideFromScreen {
  [NSThread sleepForTimeInterval:.3];
  if (self.parentViewController != nil) {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    //   [self removeFromParentViewController];
  }
}

@end
