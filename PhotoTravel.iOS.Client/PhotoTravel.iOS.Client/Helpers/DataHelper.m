//
//  DataHelper.m
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "DataHelper.h"
#import "ApplicationUser.h"

@implementation DataHelper

+ (ApplicationUser *)parseApplicationUserFromQuery:(id)queryResult {
    NSDictionary *userData = (NSDictionary *)queryResult;
    
    ApplicationUser *appUser =
    [ApplicationUser initWithId:userData[@"id"] andName:userData[@"name"]];
    
    return appUser;
}

@end
