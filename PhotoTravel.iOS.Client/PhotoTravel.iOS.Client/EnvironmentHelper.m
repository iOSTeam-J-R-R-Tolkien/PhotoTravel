#import "EnvironmentHelper.h"

#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation EnvironmentHelper

+ (BOOL)isInternetConnectionEstablished {
  Reachability *reachability = [Reachability reachabilityForInternetConnection];
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  return networkStatus != NotReachable;
}

+ (NSDate *)todayStartDate {
  NSDate *today = [NSDate date];
  NSDateComponents *components = [[NSCalendar currentCalendar]
      components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
        fromDate:today];
  components.hour = 0;
  components.minute = 0;
  components.second = 0;
  NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:components];

  return date;
}

+ (NSDate *)todayEndDate {
  NSDate *today = [NSDate date];
  NSDateComponents *components = [[NSCalendar currentCalendar]
      components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
        fromDate:today];
  components.hour = 23;
  components.minute = 59;
  components.second = 59;
  NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:components];

  return date;
}

@end
