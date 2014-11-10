//
//  SingleImageViewController.h
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LoadingScreenViewController.h"
#import "LandmarkDataProtocol.h"
#import "Landmark.h"

@interface DetailedImageViewController : UIViewController<LandmarkDataProtocol>

@property(strong, nonatomic) Landmark *landmark;
@property(strong, nonatomic) NSMutableDictionary *cachedImages;
@property(nonatomic) long postIndex;

@property (strong, nonatomic) LoadingScreenViewController *popViewController;
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;
- (IBAction)imagePinch:(UIPinchGestureRecognizer *)sender;
- (IBAction)imageTap:(UITapGestureRecognizer *)sender;

- (void)noConnectionHandler;

@end
