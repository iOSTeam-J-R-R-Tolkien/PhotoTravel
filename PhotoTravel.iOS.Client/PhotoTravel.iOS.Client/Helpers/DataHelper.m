#import "DataHelper.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "ApplicationUser.h"
#import "Landmark.h"
#import "Post.h"

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

+ (Landmark *)parseLandmarkFromQuery:(id)postLandmarkQuery
                            withPost:(Post *)post {
  PFObject *landmark = postLandmarkQuery[@"landmark"];

  Landmark *newLandmark =
      [Landmark initWithName:landmark[@"name"] withPost:post];
  newLandmark.pfObject = landmark;

  return newLandmark;
}

+ (Post *)parsePostFromQuery:(id)postQuery {
  NSString *postName = postQuery[@"name"];

  Post *newPost = [Post initWithName:postName];
  newPost.pfObject = postQuery;
  return newPost;
}

+ (Landmark *)parseLastPostWithLandmarkFromQuery:(id)queryResult {

  NSString *landmarkName = queryResult[@"name"];
  Post *post = [DataHelper parsePostFromQuery:queryResult];

  Landmark *landmark =
      [DataHelper parseLandmarkFromQuery:queryResult withPost:post];

  return landmark;
}

@end
