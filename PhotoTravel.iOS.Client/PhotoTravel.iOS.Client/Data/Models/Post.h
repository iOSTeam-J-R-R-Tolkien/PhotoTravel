//
//  Post.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface Post : NSObject
+(instancetype)initWithName:(NSString *)name
                       user:(PFUser *) user;

+(instancetype)initWithName:(NSString *)name;

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) PFObject *pfObject;
@end
