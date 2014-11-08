//
//  ApplicationUser.m
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "ApplicationUser.h"

@implementation ApplicationUser

const NSString *PROFILE_PICTURE_URL_FORMAT = @"https://graph.facebook.com/%@/picture?type=large";

+(instancetype)initWithId:(NSString *)userId andName: (NSString *)name{
    ApplicationUser *appUser = [[ApplicationUser alloc] init];
    appUser.name = name;
    appUser.userId = userId;
    appUser.profilePictureUrl = [NSString stringWithFormat:PROFILE_PICTURE_URL_FORMAT, userId];
    
    return appUser;
}

@end
