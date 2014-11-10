#import "EnvironmentHelper.h"

#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation EnvironmentHelper

+ (BOOL)isInternetConnectionEstablished {
  Reachability *reachability = [Reachability reachabilityForInternetConnection];
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  return networkStatus != NotReachable;
}

@end
