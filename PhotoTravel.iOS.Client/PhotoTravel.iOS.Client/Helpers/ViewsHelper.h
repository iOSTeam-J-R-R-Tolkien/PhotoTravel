//
//  ViewsHelper.h
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewsHelper : NSObject

+ (void)changeBackgroundImage:(UIViewController *)controller
                    withImage:(NSString *)imagePath;

+ (UIImage *)circularScaleNCrop:(UIImage *)sourceImage withRectDimensions:(CGRect)rect;
+ (void)changeImageSourceWithAnimation:(UIImage *)imageToLoad
                         forTargetView:(UIImageView *)imageContainer;

@end
