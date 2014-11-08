//
//  LandmarkModel.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Parse/Parse.h>
#import "PostModel.h"

@interface LandmarkModel : NSObject
+(instancetype)initWithPFObject:(PFObject *)data;

- (PostModel *)getLastPost;
- (void) addPostsWithNSAray:(NSArray *) posts;
-(void) addPostsWithPFObject: (NSArray *) object;

@property(strong, nonatomic) NSMutableArray *posts;

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) PFObject *pfObject;

@end
