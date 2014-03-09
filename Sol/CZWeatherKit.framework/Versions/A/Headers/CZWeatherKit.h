//
//  CZWeatherKit.h
//  CZWeatherKit
//
//  Created by Comyar Zaheri on 2/23/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>

// -----
// @name Core Imports
// -----

#import "CZWeatherKitTypes.h"
#import "CZWeatherKitAPI.h"
#import "CZWeatherDataRequest.h"
#import "CZCurrentCondition.h"
#import "CZForecastCondition.h"
#import "CZWeatherData.h"
#import "Climacons.h"

// -----
// @name APIs
// -----

#import "CZWeatherKitWundergroundAPI.h"

//
typedef void (^CZWeatherDataRequestCompletion)(CZWeatherData *weatherData, NSError *error);

/**
 */
@interface CZWeatherKit : NSObject

// -----
// @name Using a CZWeatherKit
// -----

/**
 */
+ (void)sendAsynchronousWeatherDataRequest:(CZWeatherDataRequest *)weatherDataRequest completion:(CZWeatherDataRequestCompletion)completion;

@end
