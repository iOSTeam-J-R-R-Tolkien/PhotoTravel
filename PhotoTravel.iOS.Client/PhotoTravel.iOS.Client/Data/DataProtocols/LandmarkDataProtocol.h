#import <Foundation/Foundation.h>

#import "Landmark.h"

@protocol LandmarkDataProtocol

@required
- (void)noConnectionHandler;

@optional
- (void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData;
- (void)landmarkWithPostsHander:(Landmark *)landmarkData;

@end
