//
//  CZWeatherKitTypes.h
//  CZWeatherKit
//
//  Created by Comyar Zaheri on 2/23/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 */
enum {
     /** */
    CZNoValue = NSIntegerMax
};

/**
 */
typedef struct {
    /** */
    float f;
    /** */
    float c;
} CZTemperature;

extern CZTemperature CZTemperatureMake(float f, float c);

/**
 */
typedef struct {
    /** */
    float mph;
    /** */
    float kph;
} CZWindSpeed;

extern CZWindSpeed CZWindSpeedMake(float mph, float kph);

/**
 */
typedef struct {
    /** */
    float inch;
    /** */
    float mm;
} CZPrecipitationMeasure;

extern CZPrecipitationMeasure CZPrecipitationMeasureMake(float inch, float mm);

/**
 */
typedef struct {
    /** */
    float inch;
    /** */
    float cm;
} CZSnowMeasure;

extern CZSnowMeasure CZSnowMeasureMake(float inch, float cm);

/**
 */
typedef struct {
    /** */
    float latitude;
    /** */
    float longitude;
} CZCoordinate2D;

extern CZCoordinate2D CZCoordinate2DMake(float latitude, float longitude);

/**
 */
typedef NS_ENUM(int8_t, CZWeatherKitErrorCodes) {
    /** */
    CZWeatherKitErrorCodeParseError       = -1,
    /** */
    CZWeatherKitErrorCodeDownloadError    = -2,
    /** */
    CZWeatherKitErrorCodeMissingAPIError  = -3
};

extern NSString * const CZWeatherKitClimaconsFont;

extern NSString * const CZWeatherKitErrorDomain;

extern NSString * const CZWeatherDataCity;
extern NSString * const CZWeatherDataState;
extern NSString * const CZWeatherDataStateAbbreviation;
extern NSString * const CZWeatherDataCountry;
extern NSString * const CZWeatherDataZipcode;
extern NSString * const CZWeatherDataCoordinates;
extern NSString * const CZWeatherDataLocalTime;

extern NSString * const CZWeatherDataRequestCurrentCondition;
extern NSString * const CZWeatherDataRequestThreeDayForecast;

