//
//  SOLAppDelegate.m
//  Sol
//
//  Created by Comyar Zaheri on 7/30/13.
//  Copyright (c) 2013 Comyar Zaheri. All rights reserved.
//

#import "SOLAppDelegate.h"
#import "SOLWeatherDataSource.h"

#pragma mark - SOLAppDelegate Class Extension

@interface SOLAppDelegate ()

// The initial view controller presented to the user
@property (nonatomic) SOLMainViewController *mainViewController;


@end


#pragma mark - SOLAppDelegate Implementation

@implementation SOLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    
    UIPageViewController *pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageViewController.dataSource =
    
    // Set our window's root view controller and make the app window visible
    self.window.rootViewController = self.mainViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Make sure any changes to userdefaults are saved to disk
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
