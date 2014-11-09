//
//  DataHelper.m
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "DataHelper.h"
#import "ApplicationUser.h"
#import "Landmark.h"
#import "Post.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation DataHelper

+ (ApplicationUser *)parseApplicationUserFromQuery:(id)queryResult {
  NSDictionary *userData = (NSDictionary *)queryResult;

  ApplicationUser *appUser =
      [ApplicationUser initWithId:userData[@"id"] andName:userData[@"name"]];
  appUser.facebookId = userData[@"facebookId"];
  appUser.locationId = userData[@"locationId"][@"id"];
  appUser.locationName = userData[@"location"][@"name"];
  appUser.gender = userData[@"gender"];
  appUser.birthday = userData[@"birthday"];
  appUser.relationshipStatus = userData[@"relationship_status"];

  return appUser;
}

//+ (Landmark *) parseLandmarkFromQuery:(id)postLandmarkQuery{
//    PFObject *landmark = postLandmarkQuery[@"landmark"];
//    
//    Landmark * newLandmark = [Landmark initWithName:landmark[@"name"]];
//    
//    return  newLandmark;
//}

+ (Landmark *) parseLandmarkFromQuery:(id)postLandmarkQuery
                             withPost:(Post*) post{
    PFObject *landmark = postLandmarkQuery[@"landmark"];
    
    Landmark * newLandmark = [Landmark initWithName:landmark[@"name"]
                                           withPost:post];
    newLandmark.pfObject=landmark;
    
    
    return  newLandmark;
}


+ (Post *) parsePostFromQuery:(id)postQuery{
//    PFObject *post = postQuery[@"landmark"];
    NSString *postName = postQuery[@"name"];
    
    Post * newPost = [Post initWithName:postName];
    newPost.pfObject = postQuery;
    return newPost;
}

+ (Landmark *)parseLastPostWithLandmarkFromQuery:(id)queryResult {
    
    NSString *landmarkName = queryResult[@"name"];
    Post * post = [DataHelper parsePostFromQuery:queryResult];
    
    
    Landmark *landmark = [DataHelper parseLandmarkFromQuery:queryResult
                                                   withPost:post];
    //    landmark.pfObject = queryResult;
    
    return landmark;
}


@end
