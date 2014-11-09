//
//  LandmarkModel.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Parse/Parse.h>

@interface Landmark : NSObject

@property(strong, nonatomic) NSString *name;

+ (instancetype)initWithName:(NSString *)name;

@end
