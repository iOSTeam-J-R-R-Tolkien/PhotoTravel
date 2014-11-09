//
//  DataHelper.m
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "DataHelper.h"
#import "ApplicationUser.h"
#import "Landmark.h"

@implementation DataHelper

+ (ApplicationUser *)parseApplicationUserFromQuery:(id)queryResult {
  NSDictionary *userData = (NSDictionary *)queryResult;

  ApplicationUser *appUser =
      [ApplicationUser initWithId:userData[@"id"] andName:userData[@"name"]];
  appUser.facebookId = userData[@"facebookId"];
  appUser.locationId = userData[@"locationId"][@"id"];
  appUser.locationName = userData[@"location"][@"name"];
  appUser.gender = userData[@"gender"];
  appUser.birthday = userData[@"birthday"];
  appUser.relationshipStatus = userData[@"relationship_status"];

  return appUser;
}

+ (Landmark *)parseLandmarkFromQuery:(id)queryResult {
  NSString *landmarkName = queryResult[@"name"];
  Landmark *landmark = [Landmark initWithName:landmarkName];

    return landmark;
}

@end
