#import <Foundation/Foundation.h>

#import "Statistics.h"

@interface StatisticsData : NSObject

+(void)updateStatisticsWithPostsCount:(NSNumber *)postsCount
                     andLandmarksCount:(NSNumber *)landmarksCount
                         andUsersCount:(NSNumber *)usersCount;
+(Statistics *)getTodayStatistics;
+(BOOL)isStatisticsUpToDate;

@end
