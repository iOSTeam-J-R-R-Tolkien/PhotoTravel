//
//  ProfileInformation.m
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "ProfileData.h"
#import "ProfileDataProtocol.h"
#import <Parse/Parse.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "DataHelper.h"
@import UIKit;

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
