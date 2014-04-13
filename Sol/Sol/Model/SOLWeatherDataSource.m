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

#pragma mark - SOLWeatherDataSource Class Extension

@interface SOLWeatherDataSource ()

//
@property (nonatomic) NSMutableArray *viewControllers;

// Dictionary of all weather data being managed by the app
@property (nonatomic) NSMutableDictionary   *weatherData;

@end


#pragma mark - SOLWeatherDataSource Implementation

@implementation SOLWeatherDataSource

- (instancetype)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Cannot initialize singleton SOLWeatherDataSource"
                                 userInfo:nil];
}

- (instancetype)_init
{
    if(self = [super init]) {
        
    }
    return self;
}

+ (SOLWeatherDataSource *)sharedWeatherDataSource
{
    static SOLWeatherDataSource *sharedWeatherDataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedWeatherDataSource = [[SOLWeatherDataSource alloc]_init];
    });
    return sharedWeatherDataSource;
}




- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    return nil;
}

- (void)updateWeatherDataForWeatherViewController:(SOLWeatherViewController *)weatherViewController completion:(void (^)(BOOL success))completion
{
    
}

@end
