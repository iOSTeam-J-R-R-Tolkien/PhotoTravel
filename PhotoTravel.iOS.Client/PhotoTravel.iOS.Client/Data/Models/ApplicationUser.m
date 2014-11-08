//
//  ApplicationUser.m
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "ApplicationUser.h"

@implementation ApplicationUser

+(instancetype)initWithId:(NSString *)userId andName: (NSString *)name{
    ApplicationUser *appUser = [[ApplicationUser alloc] init];
    appUser.name = name;
    appUser.userId = userId;
    
    return appUser;
}

@end
