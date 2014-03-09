//
//  CZWeatherCondition.h
//  CZWeatherKit
//
//  Created by Comyar Zaheri on 2/24/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZWeatherKitTypes.h"


/**
 */
@interface CZCurrentCondition : NSObject

/**
 */
@property (copy, nonatomic) NSString                    *condition;

/**
 */
@property (copy, nonatomic) NSString                    *conditionIcon;

/**
 */
@property (assign, nonatomic) CZTemperature             temperature;

/**
 */
@property (copy, nonatomic) NSString                    *windDirection;

/**
 */
@property (assign, nonatomic) CZWindSpeed               windSpeed;

/**
 */
@property (assign, nonatomic) CZTemperature             dewpoint;

/**
 */
@property (assign, nonatomic) CZTemperature             feelsLikeTemperature;

/**
 */
@property (assign, nonatomic) CZPrecipitationMeasure    precipitationLastHour;

/**
 */
@property (assign, nonatomic) CZPrecipitationMeasure    precipitationToday;

/**
 */
@property (strong, nonatomic) NSDate                    *timestamp;

@end
