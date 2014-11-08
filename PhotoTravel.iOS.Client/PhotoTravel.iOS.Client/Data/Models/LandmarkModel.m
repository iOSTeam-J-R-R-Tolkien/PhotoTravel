//
//  LandmarkModel.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "LandmarkModel.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "PostModel.h"

@implementation LandmarkModel

+(instancetype)initWithPFObject:(PFObject *)data{
    
    
    LandmarkModel *landmark = [[LandmarkModel alloc] init];
    
    landmark.pfObject = data;
    landmark.name = data[@"name"];
    
    landmark.posts = [[NSMutableArray alloc]init];
    
    return landmark;
}

-(void)addPostsWithNSAray:(NSArray *)posts{
    for (id post in posts) {
        [self.posts addObject:post];
    }
}

-(void)addPostsWithPFObject:(NSArray *)object {
    for (PFObject *post in object) {
        [self.posts addObject:[PostModel initWithPFObject:post]];
    }
}

-(PostModel *) getLastPost{
    if (self.posts != nil && [self.posts count] != 0 ) {
        return self.posts[0];
    }
    
    return nil;
}

@end
