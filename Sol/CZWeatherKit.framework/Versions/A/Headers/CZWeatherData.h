//
//  CZWeatherData.h
//  CZWeatherKit
//
//  Created by Comyar Zaheri on 2/23/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZWeatherKitTypes.h"

@class CZCurrentCondition;


/**
 */
@interface CZWeatherData : NSObject

- (instancetype)initWithLocale:(NSDictionary *)locale currentCondition:(CZCurrentCondition *)currentCondition
            forecastConditions:(NSArray *)forecastConditions;

+ (instancetype)weatherDataWithLocale:(NSDictionary *)locale currentCondition:(CZCurrentCondition *)currentCondition
                   forecastConditions:(NSArray *)forecastConditions;

/**
 */
@property (strong, nonatomic, readonly) NSDictionary        *locale;

/**
 */
@property (strong, nonatomic, readonly) CZCurrentCondition  *currentCondition;

/**
 */
@property (strong, nonatomic, readonly) NSArray             *forecastConditions;

@end
