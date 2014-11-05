//
//  AppDelegate.m
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/3/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "AppDelegate.h"
<<<<<<< HEAD
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>
=======
//#import "DetailViewController.h"
>>>>>>> FETCH_HEAD


#import "LoginViewController.h"
//facebook
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

//@interface AppDelegate () <UISplitViewControllerDelegate>
//@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  UISplitViewController *splitViewController =
      (UISplitViewController *)self.window.rootViewController;
  UINavigationController *navigationController =
      [splitViewController.viewControllers lastObject];
  navigationController.topViewController.navigationItem.leftBarButtonItem =
      splitViewController.displayModeButtonItem;
  splitViewController.delegate = self;

<<<<<<< HEAD
  // ****************************************************************************
  // Fill in with your Parse credentials:
  // ****************************************************************************
  [Parse setApplicationId:@"h26DZLy6933G60v7Ppcpz0gOT8aNqy044Z1rXBGi"
                clientKey:@"hlvtvqjVk5gbH8kIfcEDwenPjCuZLBT8N93ARe9M"];

  // ****************************************************************************
  // Your Facebook application id is configured in Info.plist.
  // ****************************************************************************
  [PFFacebookUtils initializeFacebook];

  return YES;
=======
#pragma mark -
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
//    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
//    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
//    splitViewController.delegate = self;
//    return YES;
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Parse credentials
    [Parse setApplicationId:@"h26DZLy6933G60v7Ppcpz0gOT8aNqy044Z1rXBGi"
                  clientKey:@"hlvtvqjVk5gbH8kIfcEDwenPjCuZLBT8N93ARe9M"];
    
    // Your Facebook application id is configured in Info.plist.
    [PFFacebookUtils initializeFacebook];
    
    // Override point for customization after application launch.
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;

>>>>>>> FETCH_HEAD
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state.
  // This can occur for certain types of temporary interruptions (such as an
  // incoming phone call or SMS message) or when the user quits the application
  // and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down
  // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate
  // timers, and store enough application state information to restore your
  // application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called
  // instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state;
  // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the
  // application was inactive. If the application was previously in the
  // background, optionally refresh the user interface.
  [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if
  // appropriate. See also applicationDidEnterBackground:.
  [[PFFacebookUtils session] close];
}

<<<<<<< HEAD
- (BOOL)application:(UIApplication *)application
              openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation {
  return [FBAppCall handleOpenURL:url
                sourceApplication:sourceApplication
                      withSession:[PFFacebookUtils session]];
}
=======
//#pragma mark - Split view
//
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
//    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
//        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//        return YES;
//    } else {
//        return NO;
//    }
//}
>>>>>>> FETCH_HEAD

@end
