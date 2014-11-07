//
//  LoadingScreenViewController.h
//  PhotoTravel
//
//  Created by Pesho on 11/6/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingScreenViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIImageView *loadingImage;
@property(strong, nonatomic) UIViewController *parentViewController;

+ (instancetype)initWithParentView:(UIViewController *)parentViewController;
- (void)showOnScreen;
- (void)hideFromScreen;
@end
