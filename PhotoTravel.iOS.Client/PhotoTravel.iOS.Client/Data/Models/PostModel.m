//
//  PostModel.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "PostModel.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation PostModel

+(instancetype)initWithPFObject:(PFObject *)data{
    //    [super init];
    PostModel *post = [[PostModel alloc] init];
    
    post.pfObject = data;
    post.name = data[@"name"];
    
    return post;
}

@end
