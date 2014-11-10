@import UIKit;
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>

#import "ProfileData.h"
#import "ProfileDataProtocol.h"
#import "DataHelper.h"
#import "EnvironmentHelper.h"

@implementation ProfileData

+ (UIImage *)getProfileImageForProfileId:(NSString *)profileId {
    
  NSString *profileImageUrl = [NSString
      stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",
                       profileId];
  UIImage *profileImage = [UIImage
      imageWithData:
          [NSData dataWithContentsOfURL:[NSURL URLWithString:profileImageUrl]]];

  return profileImage;
}

+ (void)loadProfileDataAsync:(id<ProfileDataProtocol>)delegate {
    BOOL isConnected = [EnvironmentHelper isInternetConnectionEstablished];
    if(!isConnected){
        [delegate noConnectionHandler];
        return;
    }
    
  FBRequest *request = [FBRequest requestForMe];
  [request startWithCompletionHandler:^(FBRequestConnection *connection,
                                        id result, NSError *error) {
      if (!error) {
        ApplicationUser *userData =
            [DataHelper parseApplicationUserFromQuery:result];
        [[PFUser currentUser] saveInBackground];
        [delegate userDataLoadHandler:userData];
      } else if ([[[[error userInfo] objectForKey:@"error"]
                     objectForKey:@"type"] isEqualToString:@"OAuthException"]) {
        NSLog(@"The facebook session was invalidated");
      } else {
        NSLog(@"Some other error: %@", error);
      }
  }];
}

+ (void)loadProfileImageAsync:(id<ProfileDataProtocol>)delegate
                    forUserId:(NSString *)userId {
    BOOL isConnected = [EnvironmentHelper isInternetConnectionEstablished];
    if(!isConnected){
        [delegate noConnectionHandler];
        return;
    }
    
  NSString *pictureUrlFormat = [NSString
      stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",
                       userId];
  NSURL *pictureURL = [NSURL URLWithString:pictureUrlFormat];
  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
  [NSURLConnection
      sendAsynchronousRequest:urlRequest
                        queue:[NSOperationQueue mainQueue]
            completionHandler:^(NSURLResponse *response, NSData *data,
                                NSError *connectionError) {
                if (connectionError == nil && data != nil) {
                  UIImage *img = [UIImage imageWithData:data];
                  [delegate profileImageLoadHandler:img];
                } else {
                  NSLog(@"Failed to load profile photo.");
                }
            }];
}

@end
