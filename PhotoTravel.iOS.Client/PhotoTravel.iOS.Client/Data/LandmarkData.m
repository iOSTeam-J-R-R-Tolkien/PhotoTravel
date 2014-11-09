//
//  LandmarkData.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "LandmarkData.h"

#import "LandmarkModel.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "PostModel.h"

@implementation LandmarkData

//return list of Posts for this landmark
+(NSMutableArray *)getPostsOfLandmark:(LandmarkModel *)landmark{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"landmark" equalTo:landmark.pfObject];
    
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
    
    //    //2nd way
    //    //assync
    //    NSMutableArray *output2 = [[NSMutableArray init]alloc];
    //    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
    //        if (!posts) {
    //            NSLog(@"The getFirstObject request failed.");
    //        } else {
    //                NSLog(@"Successfully retrieved the object. %@", posts);
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

+(PostModel *)addNewPostWithPostModel:(PostModel *)postModel
                           toLandmark:(LandmarkModel *) landmark
                          currentUser:(PFUser *) user{
    //TODO: extract create ne PFObject to PostModel class InitNewPostModel
    PFObject *newPost = [PFObject objectWithClassName:@"Post"];
    newPost[@"name"] = postModel.name;
    newPost[@"landmark"] = landmark;
    newPost[@"user"] = user;
    [newPost save];
    
    //return last added post
    PFQuery *queryLastPost = [PFQuery queryWithClassName:@"Post"];
    [queryLastPost orderByDescending:@"createdAt"];
    [queryLastPost whereKey:@"landmark" equalTo:landmark.pfObject];
    
    
    //1st way
    //sych - dava 4e prekaleno dylyg proces se osy6testvqva na glavnata nishka, a assycjh ne raboti -.-
    PFObject * firstPost = [queryLastPost getFirstObject];
    //transforme PFObject to PostModel and return it
    if(firstPost){
        NSLog(@"retrieved related post: %@", firstPost);
        return [PostModel initWithPFObject:firstPost];
    }
    else{
        NSLog(@"The getFirstObject request failed.");
        return nil;
    }
    
    //    //2nd way
    //    //assync
    //    [query getFirstObjectInBackgroundWithBlock:^(PFObject *firstPost, NSError *error) {
    //        if (!firstPost) {
    //            NSLog(@"The getFirstObject request failed.");
    //              return  nil;
    //        } else {
    //            NSLog(@"Successfully retrieved the object. %@", firstPost);
    //            return [PostModel initWithPFObject:firstPost];
    //        }
    //
    //        return  nil;
    //    }];
}

@end
