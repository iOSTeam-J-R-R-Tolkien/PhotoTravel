//
//  LandmarkData.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Landmark.h"

@interface LandmarkData : NSObject

//+(NSMutableArray *)getPostsOfLandmark:(Landmark *)landmark;
//+(PostModel *)addNewPostWithPostModel:(PostModel *)postModel
//                           toLandmark:(Landmark *) landmark
//                          currentUser:(PFUser *) user;
+ (void)getLastPostsAsync:(int)count
                      for:(id<LandmarkDataProtocol>)delegate;
//+ (void)getLandmarkPosts:(Landmark *)landmark
//                     for:(id<LandmarkDataProtocol>)delegate;
@end
