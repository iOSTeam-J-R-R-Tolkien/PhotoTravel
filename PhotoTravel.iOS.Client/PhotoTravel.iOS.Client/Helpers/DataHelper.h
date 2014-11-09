//
//  DataHelper.h
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApplicationUser.h"
#import "Landmark.h"

@interface DataHelper : NSObject

+ (ApplicationUser *)parseApplicationUserFromQuery:(id)queryResult;
+ (Landmark *)parseLandmarkFromQuery:(id)queryResult;

@end
