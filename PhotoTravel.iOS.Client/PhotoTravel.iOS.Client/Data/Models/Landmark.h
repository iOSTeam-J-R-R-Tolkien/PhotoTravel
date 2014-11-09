//
//  LandmarkModel.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Parse/Parse.h>
#import "Post.h"

@interface Landmark : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSMutableArray *posts;

//PFObject !!
@property(strong, nonatomic) PFObject *pfObject;


+ (instancetype)initWithName:(NSString *)name;
+ (instancetype)initWithName:(NSString *)name
                    withPost:(Post * ) post;
+ (instancetype)initWithName:(NSString *)name
                    withPosts:(NSArray * ) posts;
@end
