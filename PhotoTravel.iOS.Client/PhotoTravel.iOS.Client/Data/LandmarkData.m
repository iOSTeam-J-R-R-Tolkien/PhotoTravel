//
//  LandmarkData.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "LandmarkDataProtocol.h"
#import "LandmarkData.h"
#import "DataHelper.h"

@implementation LandmarkData

+ (void)getLastPostsAsync:(int)count for:(id<LandmarkDataProtocol>)delegate {
  PFQuery *query = [PFQuery queryWithClassName:@"Post"];
  [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
      if (!posts) {
        NSLog(@"The getFirstObject request failed.");
      } else {
        NSLog(@"Successfully retrieved the object. %@", posts);
        NSMutableArray *outputData = [[NSMutableArray alloc] init];
        for (PFObject *post in posts) {
          Landmark *landmark = [DataHelper parseLandmarkFromQuery:post];
          [outputData addObject:landmark];
          NSLog(@"retrieved related post: %@", post);
        }
        [delegate lastPostsDataLoadHandler:outputData];
      }
  }];
}

@end
