#import <Foundation/Foundation.h>

#import "ApplicationUser.h"
#import "Landmark.h"

@interface DataHelper : NSObject

+ (ApplicationUser *)parseApplicationUserFromQuery:(id)queryResult;
+ (Landmark *)parseLastPostWithLandmarkFromQuery:(id)queryResult;
+ (Landmark *)parsePostFromQuery:(id)queryResult;

@end
