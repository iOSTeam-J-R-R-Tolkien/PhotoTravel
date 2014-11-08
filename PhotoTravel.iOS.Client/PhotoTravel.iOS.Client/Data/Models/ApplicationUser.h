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

+(instancetype)initWithId:(NSString *)userId andName: (NSString *)name;

@end
