
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "LandmarkData.h"
#import "LandmarkDataProtocol.h"
#import "DataHelper.h"
#import "EnvironmentHelper.h"


@implementation LandmarkData

+ (void)getLastPostsAsync:(int)count
                      for:(id<LandmarkDataProtocol>)delegate {
    BOOL isConnected = [EnvironmentHelper isInternetConnectionEstablished];
    if(!isConnected){
        [delegate noConnectionHandler];
        return;
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"landmark"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (!posts) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            NSLog(@"Successfully retrieved the object. %@", posts);
            NSMutableArray *outputData = [[NSMutableArray alloc] init];
            for (PFObject *post in posts) {
                PFObject *thisLandmark = post[@"landmark"];
                NSLog(@"retrieved related landmark to the post: %@", thisLandmark);
                NSLog(@"retrieved related landmark to the post: %@", thisLandmark[@"image"]);
                
                Landmark *landmark = [DataHelper parseLastPostWithLandmarkFromQuery:post];
                [outputData addObject:landmark];
                NSLog(@"retrieved related post: %@", post);
            }
            [delegate lastPostsDataLoadHandler:outputData];
        }
    }];
}

+ (void)getLandmarkWithPostsAsync:(Landmark *)landmark
                     for:(id<LandmarkDataProtocol>)delegate {
    BOOL isConnected = [EnvironmentHelper isInternetConnectionEstablished];
    if(!isConnected){
        [delegate noConnectionHandler];
        return;
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"landmark" equalTo:landmark.pfObject];

    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (!posts) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            NSLog(@"Successfully retrieved the object. %@", posts);
            NSMutableArray *outputData = [[NSMutableArray alloc] init];
            for (PFObject *post in posts) {
                Landmark *landmark = [DataHelper parsePostFromQuery:post];
                [outputData addObject:landmark];
                NSLog(@"retrieved related post: %@", post);
            }
            landmark.posts = outputData;
            [delegate landmarkWithPostsHander:landmark];
        }
    }];
}



@end
