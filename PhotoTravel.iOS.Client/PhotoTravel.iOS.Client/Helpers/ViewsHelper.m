	//
//  ViewsHelper.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "ViewsHelper.h"
#import <UIKit/UIKit.h>

@implementation ViewsHelper

+ (void)changeBackgroundImage:(UIViewController *)controller
                    withImage:(NSString *)imagePath {
  UIImage *imageView = [UIImage imageNamed:imagePath];

  UIImageView *backgroundImage =
      [[UIImageView alloc] initWithFrame:controller.view.frame];
  [backgroundImage setImage:imageView];

  [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];

  [controller.view insertSubview:backgroundImage atIndex:0];
}

+ (UIImage *)circularScaleNCrop:(UIImage *)sourceImage withRectDimensions:(CGRect)rect{
    // This function returns a newImage, based on image, that has been:
    // - scaled to fit in (CGRect) rect
    // - and cropped within a circle of radius: rectWidth/2
    
    // Create the bitmap graphics context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rect.size.width, rect.size.height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Get the width and heights
    CGFloat imageWidth = sourceImage.size.width;
    CGFloat imageHeight = sourceImage.size.height;
    CGFloat rectWidth = rect.size.width;
    CGFloat rectHeight = rect.size.height;
    
    // Calculate the scale factor
    CGFloat scaleFactorX = rectWidth / imageWidth;
    CGFloat scaleFactorY = rectHeight / imageHeight;
    
    // Calculate the centre of the circle
    CGFloat imageCentreX = rectWidth / 2;
    CGFloat imageCentreY = rectHeight / 2;
    
    // Create and CLIP to a CIRCULAR Path
    // (This could be replaced with any closed path if you want a different shaped
    // clip)
    CGFloat radius = rectWidth / 2;
    CGContextBeginPath(context);
    CGContextAddArc(context, imageCentreX, imageCentreY, radius, 0, 2 * M_PI, 0);
    CGContextClosePath(context);
    CGContextClip(context);
    
    // Set the SCALE factor for the graphics context
    // All future draw calls will be scaled by this factor
    CGContextScaleCTM(context, scaleFactorX, scaleFactorY);
    
    // Draw the IMAGE
    CGRect myRect = CGRectMake(0, 0, imageWidth, imageHeight);
    [sourceImage drawInRect:myRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



@end
