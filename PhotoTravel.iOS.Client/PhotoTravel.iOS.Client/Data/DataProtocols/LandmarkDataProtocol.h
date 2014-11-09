//
//  LastPostWithLandmarkDataProtocol.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Landmark.h"

@protocol LandmarkDataProtocol

-(void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData;

@end
