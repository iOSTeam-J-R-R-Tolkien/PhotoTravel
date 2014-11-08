//
//  PostModel.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "PostModel.h"

@interface PostModel : NSObject

+(instancetype)initWithPFObject:(PFObject *)data;

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) PFObject *pfObject;

@end
