#import "Statistics.h"

#import "StatisticsData.h"

#import "CoreDataHelper.h"
#import "EnvironmentHelper.h"

@implementation StatisticsData

static CoreDataHelper *cdHelper;

+ (void)updateStatisticsWithPostsCount:(NSNumber *)postsCount
                     andLandmarksCount:(NSNumber *)landmarksCount
                         andUsersCount:(NSNumber *)usersCount {
  [StatisticsData initStorageHelper];
  [StatisticsData deleteOldStatistics];

  Statistics *todayStats = [self getTodayStatistics];

  if (todayStats == nil) {
    Statistics *stats =
        [NSEntityDescription insertNewObjectForEntityForName:@"Statistics"
                                      inManagedObjectContext:cdHelper.context];
    stats.postsCount = postsCount;
    stats.landmarksCount = landmarksCount;
    stats.usersCount = usersCount;
    stats.lastUpdateDate = [NSDate date];
    [cdHelper.context insertObject:stats];
    [cdHelper saveContext];
  }
}

+ (Statistics *)getTodayStatistics {
  [self initStorageHelper];

  NSFetchRequest *request =
      [NSFetchRequest fetchRequestWithEntityName:@"Statistics"];
  NSPredicate *predicate = [NSPredicate
      predicateWithFormat:@"lastUpdateDate >= %@ AND lastUpdateDate <= %@",
                          [EnvironmentHelper todayStartDate],
                          [EnvironmentHelper todayEndDate]];
  [request setPredicate:predicate];
  NSArray *fetchedObjects =
      [cdHelper.context executeFetchRequest:request error:nil];

  if (fetchedObjects.count == 0) {
    return nil;
  } else {
    return (Statistics *)fetchedObjects[0];
  }
}

+ (BOOL)isStatisticsUpToDate {
  [self initStorageHelper];

  Statistics *todayStats = [self getTodayStatistics];
  if (todayStats) {
    return YES;
  } else {
    return NO;
  }
}

+ (void)deleteOldStatistics {
  [StatisticsData initStorageHelper];

  NSFetchRequest *allStatistics = [[NSFetchRequest alloc] init];
  [allStatistics
      setEntity:[NSEntityDescription entityForName:@"Statistics"
                            inManagedObjectContext:cdHelper.context]];
  NSPredicate *predicate = [NSPredicate
      predicateWithFormat:@"lastUpdateDate >= %@ AND lastUpdateDate <= %@",
                          [EnvironmentHelper todayEndDate],
                          [EnvironmentHelper todayStartDate]];
  [allStatistics setPredicate:predicate];
  NSError *error = nil;
  NSArray *statistics =
      [cdHelper.context executeFetchRequest:allStatistics error:&error];
  for (NSManagedObject *stat in statistics) {
    [cdHelper.context deleteObject:stat];
  }
}

+ (void)initStorageHelper {
  if (cdHelper == nil) {
    cdHelper = [[CoreDataHelper alloc] init];
    [cdHelper setupCoreData];
  }
}

@end
