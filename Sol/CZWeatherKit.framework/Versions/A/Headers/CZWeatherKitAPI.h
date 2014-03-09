//
//  CZWeatherDataAPI.h
//  CZWeatherKit
//
//  Created by Comyar Zaheri on 2/23/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import <Foundation/Foundation.h>

// -----
// @name Forward Declarations
// -----

@class CZWeatherData;
@class CZWeatherDataRequest;


/**
 */
@protocol CZWeatherKitAPI <NSObject>

// -----
// @name Required Methods
// -----

@required

/**
 */
- (NSURL *)urlForWeatherDataRequest:(CZWeatherDataRequest *)weatherDataRequest;

/**
 */
- (CZWeatherData *)weatherDataForData:(NSData *)data weatherDataRequest:(CZWeatherDataRequest *)weatherDataRequest;

@end
