//
//  SOLAppDelegate.m
//  Sol
//
//  Created by Comyar Zaheri on 7/30/13.
//  Copyright (c) 2013 Comyar Zaheri. All rights reserved.
//

#import "SOLAppDelegate.h"
#import "SOLWeatherDataSource.h"
#import "SOLAddLocationViewController.h"
#import "SOLSettingsViewController.h"

#pragma mark - SOLAppDelegate Class Extension

@interface SOLAppDelegate ()

//
@property (nonatomic) SOLSettingsViewController     *settingsViewController;

//
@property (nonatomic) SOLAddLocationViewController  *addLocationViewController;

@end


#pragma mark - SOLAppDelegate Implementation

@implementation SOLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    
    UIPageViewController *pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageViewController.dataSource = [SOLWeatherDataSource sharedWeatherDataSource];
    
    // Set our window's root view controller and make the app window visible
    self.window.rootViewController = pageViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[SOLWeatherDataSource sharedWeatherDataSource].locationManager stopUpdatingLocation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[SOLWeatherDataSource sharedWeatherDataSource].locationManager startUpdatingLocation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Make sure any changes to userdefaults are saved to disk
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
