//
//  LandmarkData.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Landmark.h"
#import "LandmarkDataProtocol.h"

@interface LandmarkData : NSObject

+ (void)getLastPostsAsync:(int)count
                      for:(id<LandmarkDataProtocol>)delegate;
+ (void)getLandmarkWithPostsAsync:(Landmark *)landmark
                              for:(id<LandmarkDataProtocol>)delegate;
@end
