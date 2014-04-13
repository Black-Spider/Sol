//
//  SOLWeatherViewControllerDataSource.h
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

@import UIKit;
@import Foundation;
@class SOLWeatherViewController;

@interface SOLWeatherDataSource : NSObject <UIPageViewControllerDataSource>

+ (SOLWeatherDataSource *)sharedWeatherDataSource;


- (void)updateWeatherDataForWeatherViewController:(SOLWeatherViewController *)weatherViewController
                                       completion:(void (^)(BOOL success))completion;

@end
