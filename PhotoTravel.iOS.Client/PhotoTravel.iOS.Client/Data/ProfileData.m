//
//  ProfileInformation.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "ProfileData.h"
@import UIKit;

@implementation ProfileData

+ (UIImage *)getProfileImageForProfileId:(NSString *)profileId {
  NSString *profileImageUrl = [NSString
      stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",
                       profileId];
  UIImage *profileImage = [UIImage
      imageWithData:
          [NSData dataWithContentsOfURL:[NSURL URLWithString:profileImageUrl]]];
    
    return profileImage;
}

@end
