//
//  SOLWeatherViewControllerDataSource.m
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "SOLWeatherDataSource.h"
#import "SOLWeatherViewController.h"
#import "SOLStateManager.h"


// Minimum time between each weather data update
static const CGFloat    kMinTimeBetweenUpdates  = 3600.0;


@interface SOLWeatherDataSource ()

@property (nonatomic) NSArray *viewControllers;

// Dictionary of all weather data being managed by the app
@property (nonatomic) NSMutableDictionary   *weatherData;

@end

@implementation SOLWeatherDataSource

- (instancetype)init
{
    if(self = [super init]) {
        // Initialize the weather data dictionary with saved data, if it exists
        NSDictionary *savedWeatherData = [SOLStateManager weatherData];
        if(savedWeatherData) {
            self.weatherData = [NSMutableDictionary dictionaryWithDictionary:savedWeatherData];
        } else {
            self.weatherData = [NSMutableDictionary dictionaryWithCapacity:5];
        }
    }
    return self;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    return nil;
}

- (void)updateWeatherDataWithCompletion:(void (^)(BOOL))completion
{
    
}

@end
