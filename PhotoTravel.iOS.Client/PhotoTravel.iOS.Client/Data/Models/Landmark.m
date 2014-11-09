//
//  LandmarkModel.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "Landmark.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation Landmark

+ (instancetype)initWithName:(NSString *)name {
  Landmark *landmark = [[Landmark alloc] init];
  landmark.name = name;

  return landmark;
}

@end
