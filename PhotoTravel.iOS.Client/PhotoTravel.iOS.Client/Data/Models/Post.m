//
//  Post.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "Post.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation Post
+(instancetype)initWithName:(NSString *)name user:(id)user{
    Post *post = [[Post alloc] init];
    post.name = name;
    
    return post;
}
+(instancetype)initWithName:(NSString *)name {
    Post *post = [[Post alloc] init];
    post.name = name;
    
    return post;
}
@end
