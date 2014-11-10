//
//  PostsData.m
//  PhotoTravel.iOS.Client
//
//  Created by Pesho on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

#import "PostsData.h"

@implementation PostsData

+(void)loadImageFromPostAsync:(PFObject *) post andLoadHandler:(void (^)(UIImage *))delegate{
    PFFile *userImageFile = post[@"image"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image =[UIImage imageWithData:imageData];
            delegate(image);
        }
    }];
}

@end
