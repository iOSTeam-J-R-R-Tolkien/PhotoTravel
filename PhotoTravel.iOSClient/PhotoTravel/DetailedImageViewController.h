//
//  SingleImageViewController.h
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingScreenViewController.h"

@interface DetailedImageViewController : UIViewController

@property (strong, nonatomic) LoadingScreenViewController *popViewController;
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;
- (IBAction)imagePinch:(UIPinchGestureRecognizer *)sender;

@end
