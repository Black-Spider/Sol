//
//  SOLWeatherViewControllerDataSource.m
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "SOLWeatherDataSource.h"
#import "SOLWeatherViewController.h"
#import "SOLWundergroundDownloader.h"
#import "SOLStateManager.h"


// Minimum time between each weather data update
static const CGFloat    kMinTimeBetweenUpdates  = 3600.0;

#pragma mark - SOLWeatherDataSource Class Extension

@interface SOLWeatherDataSource ()

@property (nonatomic) SOLWeatherViewController *localWeatherViewController;

//
@property (nonatomic) NSMutableArray *viewControllers;

// Dictionary of all weather data being managed by the app
@property (nonatomic) NSMutableDictionary   *weatherData;

//
@property (nonatomic) CLLocationManager     *locationManager;

@end


#pragma mark - SOLWeatherDataSource Implementation

@implementation SOLWeatherDataSource

- (instancetype)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"Cannot initialize singleton SOLWeatherDataSource."
                                 userInfo:nil];
}

- (instancetype)_init
{
    if(self = [super init]) {
        
        NSArray *viewControllers = [SOLStateManager weatherViewControllers];
        if(viewControllers) {
            self.viewControllers = [NSMutableArray arrayWithArray:viewControllers];
        } else {
            self.viewControllers = [NSMutableArray new];
        }
        
        self.locationManager = ({
            CLLocationManager *locationManager = [CLLocationManager new];
            locationManager.distanceFilter = 3000;
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
            locationManager.delegate = self;
            locationManager;
        });
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

#pragma mark Using the SOLWeatherDataSource

- (void)createWeatherViewControllerForLocation:(CLLocation *)location
{
    
}

#pragma mark UIPageViewControllerDataSource Methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if(index == NSNotFound || index == [self.viewControllers count] - 1) {
        return nil;
    }
    
    return self.viewControllers[index + 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if(index == NSNotFound || index == 0) {
        return nil;
    }
    
    return self.viewControllers[index - 1];
}

#pragma mark CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusDenied ||
       status == kCLAuthorizationStatusRestricted) {
        [self.viewControllers removeObject:self.localWeatherViewController];
    } else if(status == kCLAuthorizationStatusAuthorized) {
        NSLog(@"Authorized Location Services");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *mostRecentLocation = [locations lastObject];
    if(!self.localWeatherViewController) {
        self.localWeatherViewController = [SOLWeatherViewController new];
        [self.viewControllers insertObject:self.localWeatherViewController atIndex:0];
    }
    
    self.localWeatherViewController.location = mostRecentLocation;
}


@end
