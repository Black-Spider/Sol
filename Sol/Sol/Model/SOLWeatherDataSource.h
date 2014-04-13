//
//  SOLWeatherViewControllerDataSource.h
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

@import UIKit;
@import Foundation;

@interface SOLWeatherDataSource : NSObject <UIPageViewControllerDataSource>

- (void)updateWeatherDataWithCompletion:(void (^)(BOOL))completion;

@end
