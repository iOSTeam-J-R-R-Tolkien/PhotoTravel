//
//  ApplicationUser.h
//  PhotoTravel
//
//  Created by Pesho on 11/8/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationUser : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *userId;
@property(strong, nonatomic) NSString *facebookId;
@property(strong, nonatomic) NSString *locationId;
@property(strong, nonatomic) NSString *locationName;
@property(strong, nonatomic) NSString *gender;
@property(strong, nonatomic) NSString *birthday;
@property(strong, nonatomic) NSString *relationshipStatus;
@property(strong, nonatomic) NSString *profilePictureUrl;

+(instancetype)initWithId:(NSString *)userId andName: (NSString *)name;

@end
