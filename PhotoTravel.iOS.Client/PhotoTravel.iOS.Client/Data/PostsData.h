//
//  PostsData.h
//  PhotoTravel.iOS.Client
//
//  Created by Pesho on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PostDataProtocol.h"

@interface PostsData : NSObject

+(void)loadImageFromPostAsync:(PFObject *) post for:(id<PostDataProtocol>)resultConsumer andLoadHandler:(void (^)(UIImage *))delegate;

@end
