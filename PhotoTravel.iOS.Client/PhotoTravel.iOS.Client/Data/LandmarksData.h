#import <Foundation/Foundation.h>

#import "LandmarkDataProtocol.h"
#import "Landmark.h"

@interface LandmarksData : NSObject

+ (void)getLastPostsAsync:(int)count
                      for:(id<LandmarkDataProtocol>)delegate;
+ (void)getLandmarkWithPostsAsync:(Landmark *)landmark
                              for:(id<LandmarkDataProtocol>)delegate;
@end
