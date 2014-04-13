//
//  SOLWeatherView.h
//  Sol
//
//  Created by Comyar Zaheri on 8/3/13.
//  Copyright (c) 2013 Comyar Zaheri. All rights reserved.
//

@class SOLWeatherData;

/**
 SOLWeatherView is used to display weather data for a single location to the user. Every instance
 of SOLWeatherView is managed by SOLMainViewController only.
 */
@interface SOLWeatherView : UIView <UIGestureRecognizerDelegate>

// -----
// @name Properties
// -----

// YES if view contains weather data
@property (assign, nonatomic)                       BOOL    hasData;

// YES if view contains local weather data
@property (assign, nonatomic, getter = isLocal)     BOOL    local;

// Displays the time the weather data for this view was last updated
@property (nonatomic, readonly) UILabel *updatedLabel;

// Displays the icon for current conditions
@property (nonatomic, readonly) UILabel *conditionIconLabel;

// Displays the description of current conditions
@property (nonatomic, readonly) UILabel *conditionDescriptionLabel;

// Displays the location whose weather data is being represented by this weather view
@property (nonatomic, readonly) UILabel *locationLabel;

// Displays the current temperature
@property (nonatomic, readonly) UILabel *currentTemperatureLabel;

// Displays both the high and low temperatures for today
@property (nonatomic, readonly) UILabel *hiloTemperatureLabel;

// Displays the day of the week for the first forecast snapshot
@property (nonatomic, readonly) UILabel *forecastDayOneLabel;

// Displays the day of the week for the second forecast snapshot
@property (nonatomic, readonly) UILabel *forecastDayTwoLabel;

// Displays the day of the week for the third forecast snapshot
@property (nonatomic, readonly) UILabel *forecastDayThreeLabel;

// Displays the icon representing the predicted conditions for the first forecast snapshot
@property (nonatomic, readonly) UILabel *forecastIconOneLabel;

// Displays the icon representing the predicted conditions for the second forecast snapshot
@property (nonatomic, readonly) UILabel *forecastIconTwoLabel;

// Displays the icon representing the predicted conditions for the third forecast snapshot
@property (nonatomic, readonly) UILabel *forecastIconThreeLabel;

// Indicates whether data is being downloaded for this weather view
@property (nonatomic, readonly) UIActivityIndicatorView *activityIndicator;

@end
