//
//  CZForecastCondition.h
//  CZWeatherKit
//
//  Created by Comyar Zaheri on 3/9/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZWeatherKitTypes.h"


/**
 */
@interface CZForecastCondition : NSObject

/**
 */
@property (copy, nonatomic) NSString                    *condition;

/**
 */
@property (copy, nonatomic) NSString                    *conditionIcon;

/**
 */
@property (assign, nonatomic) CZTemperature             highTemperature;

/**
 */
@property (assign, nonatomic) CZTemperature             lowTemperature;

/**
 */
@property (assign, nonatomic) CZPrecipitationMeasure    precipitationMeasureAllDay;

/**
 */
@property (assign, nonatomic) CZPrecipitationMeasure    precipitationMeasureDay;

/**
 */
@property (assign, nonatomic) CZPrecipitationMeasure    precipitationMeasureNight;

/**
 */
@property (assign, nonatomic) CZSnowMeasure             snowMeasureAllDay;

/**
 */
@property (assign, nonatomic) CZSnowMeasure             snowMeasureDay;

/**
 */
@property (assign, nonatomic) CZSnowMeasure             snowMeasureNight;

/**
 */
@property (assign, nonatomic) CZWindSpeed               maxWindSpeed;

/**
 */
@property (assign, nonatomic) CZWindSpeed               averageWindSpeed;

/**
 */
@property (assign, nonatomic) float                     minHumidity;

/**
 */
@property (assign, nonatomic) float                     maxHumidity;

/**
 */
@property (strong, nonatomic) NSDate                    *timestamp;

@end
