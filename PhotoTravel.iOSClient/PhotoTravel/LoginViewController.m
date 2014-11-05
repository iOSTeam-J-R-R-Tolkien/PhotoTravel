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
}

@end
