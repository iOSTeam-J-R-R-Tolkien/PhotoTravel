//
//  LandmarkData.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PostModel.h"
#import "LandmarkModel.h"

@interface LandmarkData : NSObject

+(NSMutableArray *)getPostsOfLandmark:(LandmarkModel *)landmark;
+(PostModel *)addNewPostWithPostModel:(PostModel *)postModel
                           toLandmark:(LandmarkModel *) landmark
                          currentUser:(PFUser *) user;
@end
