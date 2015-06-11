//
//  AppDelegate.m
//  AppSearchDemo
//
//  Created by Tudor Jenkins on 11/06/2015.
//  Copyright © 2015 WideEyedVision. All rights reserved.
//

#import "AppDelegate.h"
#import "ASDDataManager.h"
#import "ASDMainViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>


@interface AppDelegate ()
@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler {
    
    if ([[userActivity activityType] isEqualToString:CSSearchableItemActionType]) {
        NSString *uniqueIdentifier = [userActivity.userInfo objectForKey:CSSearchableItemActivityIdentifier];
        NSLog(@"Got unique: %@", uniqueIdentifier);
        
        UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
        ASDMainViewController *controller = (ASDMainViewController *)navController.viewControllers[0];
        return [controller restoreUserActivityStateWithPersonIndex:uniqueIdentifier.integerValue];
    }
    
    return NO;
}

@end
