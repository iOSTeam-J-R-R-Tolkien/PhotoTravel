#import <Foundation/Foundation.h>

@interface EnvironmentHelper : NSObject

+ (BOOL)isInternetConnectionEstablished;
+ (NSDate *)todayEndDate;
+ (NSDate *)todayStartDate;

@end
