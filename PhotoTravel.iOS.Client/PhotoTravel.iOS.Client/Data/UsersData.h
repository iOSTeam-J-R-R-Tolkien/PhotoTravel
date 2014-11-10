@import UIKit;
#import <Foundation/Foundation.h>

#import "ProfileDataProtocol.h"

@interface UsersData : NSObject

+(UIImage *)getProfileImageForProfileId:(NSString *)profileId;
+ (void)getProfileImageForProfileIdAsync:(NSString *)profileId for:(id<UsersDataProtocol>)resultConsumer
                          andLoadHandler:(void (^)(UIImage *))delegate;

+ (void)loadProfileDataAsync:(id<UsersDataProtocol>)delegate;
+ (void)loadProfileImageAsync:(id<UsersDataProtocol>)delegate forUserId:(NSString *)userId;

@end
