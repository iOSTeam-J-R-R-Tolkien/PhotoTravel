//
//  ProfileInformation.h
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileDataProtocol.h"
@import UIKit;

@interface ProfileData : NSObject

+(UIImage *)getProfileImageForProfileId:(NSString *)profileId;

+ (void)loadProfileDataAsync:(id<ProfileDataProtocol>)delegate;
+ (void)loadProfileImageAsync:(id<ProfileDataProtocol>)delegate forUserId:(NSString *)userId;

@end
