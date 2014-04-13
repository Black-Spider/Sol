//
//  SOLWeatherViewControllerDataSource.h
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

@import UIKit;
@import Foundation;
@import CoreLocation;

@class SOLWeatherData;
@class SOLWeatherViewController;

typedef void (^SOLWeatherDataSourceCompletion)(SOLWeatherData *weatherData);

@interface SOLWeatherDataSource : NSObject <UIPageViewControllerDataSource, CLLocationManagerDelegate>

+ (SOLWeatherDataSource *)sharedWeatherDataSource;

- (void)createWeatherViewControllerForLocation:(CLLocation *)location;

@property (nonatomic, readonly) CLLocationManager *locationManager;

@end
