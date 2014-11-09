//
//  LastPostWithLandmarkData.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/8/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "LastPostWithLandmarkData.h"

#import "LandmarkModel.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "PostModel.h"

@implementation LastPostWithLandmarkData

const int QUERY_LIMIT  = 10;

+(NSMutableArray *)getLastPosts{
    return [self getLastPosts:QUERY_LIMIT];
}

+(NSMutableArray *)getLastPosts:(int)count{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//        [query orderByDescending:@"createdAt"];
//    
//        [query includeKey:@"Post.landmark"];
//        [query includeKey:@"landmark"];
//        query.limit = count;
    
        //1st way
        //sych - dava 4e prekaleno dylyg proces se osy6testvqva na glavnata nishka, a assycjh ne raboti -.-
        NSArray * posts = [query findObjects];
        NSMutableArray *output = [[NSMutableArray init]alloc];
        for (PFObject *post in posts) {
            //transforme PFObject to PostModel and add it to output
            [output addObject:[PostModel initWithPFObject:post]];
            NSLog(@"retrieved related post: %@", post);
        }
        int x = 32523;
        return output;
    
//      //2nd way
//    //assync
//    NSMutableArray *output2 = [[NSMutableArray init]alloc];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
//        if (!posts) {
//            NSLog(@"The getFirstObject request failed.");
//        } else {
//            NSLog(@"Successfully retrieved the object. %@", posts);
//        
//            for (PFObject *post in posts) {
    
//                //transforme PFObject to PostModel and add it to output
//                [output2 addObject:[PostModel initWithPFObject:post]];
//                NSLog(@"retrieved related post: %@", post);
//            }
//        }
//        
//        return  output2;
//    }];
}
@end
