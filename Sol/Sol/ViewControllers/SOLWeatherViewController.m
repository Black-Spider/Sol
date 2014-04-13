//
//  SOLWeatherViewController.m
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "SOLWeatherViewController.h"
#import "SOLWeatherView.h"
#import "SOLWundergroundDownloader.h"
#import "SOLWeatherData.h"
#import "SOLStateManager.h"

// Name of the default gradient image file
static NSString * const kDefaultBackgroundGradientName = @"gradient5";

@interface SOLWeatherViewController ()

//
@property (nonatomic) SOLWeatherView *weatherView;

@end

@implementation SOLWeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.weatherView = ({
            SOLWeatherView *weatherView = [[SOLWeatherView alloc]initWithFrame:self.view.bounds];
            weatherView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:kDefaultBackgroundGradientName]];
            weatherView;
        });
        [self.view addSubview:self.weatherView];
    }
    return self;
}

- (void)setLocation:(CLLocation *)location
{
    if(location == _location) {
        return;
    }
    
    _location = location;
    
    [[SOLWundergroundDownloader sharedDownloader]dataForLocation:_location completion:^(SOLWeatherData *weatherData, NSError *error) {
        [self updateWeatherViewWithData:weatherData];
    }];
}

- (void)updateWeatherViewWithData:(SOLWeatherData *)weatherData
{
    if(!weatherData) {
        return;
    }
    
    // Set the update time
    //    weatherView.updatedLabel.text = [NSString stringWithFormat:@"Updated %@", [self.dateFormatter stringFromDate:data.timestamp]];
    
    // Set the current condition icon and description
    self.weatherView.conditionIconLabel.text         = weatherData.currentSnapshot.icon;
    self.weatherView.conditionDescriptionLabel.text  = weatherData.currentSnapshot.conditionDescription;
    
    // Only show the country name if not the United States
    NSString *city      = weatherData.placemark.locality;
    NSString *state     = weatherData.placemark.administrativeArea;
    NSString *country   = weatherData.placemark.country;
    if([[country lowercaseString] isEqualToString:@"united states"]) {
        self.weatherView.locationLabel.text = [NSString stringWithFormat:@"%@, %@", city, state];
    } else {
        self.weatherView.locationLabel.text = [NSString stringWithFormat:@"%@, %@", city, country];
    }
    
    SOLTemperature currentTemperature   = weatherData.currentSnapshot.currentTemperature;
    SOLTemperature highTemperature      = weatherData.currentSnapshot.highTemperature;
    SOLTemperature lowTemperature       = weatherData.currentSnapshot.lowTemperature;
    
    // Set the temperature labels depending on the current scale set in the settings
    if([SOLStateManager temperatureScale] == SOLFahrenheitScale) {
        self.weatherView.currentTemperatureLabel.text = [NSString stringWithFormat:@"%.0f°", currentTemperature.fahrenheit];
        self.weatherView.hiloTemperatureLabel.text = [NSString stringWithFormat:@"H %.0f  L %.0f", highTemperature.fahrenheit, lowTemperature.fahrenheit];
    } else {
        self.weatherView.currentTemperatureLabel.text = [NSString stringWithFormat:@"%.0f°", currentTemperature.celsius];
        self.weatherView.hiloTemperatureLabel.text = [NSString stringWithFormat:@"H %.0f  L %.0f", highTemperature.celsius, lowTemperature.celsius];
    }
    
    SOLWeatherSnapshot *forecastDayOneSnapshot      = [weatherData.forecastSnapshots objectAtIndex:0];
    SOLWeatherSnapshot *forecastDayTwoSnapshot      = [weatherData.forecastSnapshots objectAtIndex:1];
    SOLWeatherSnapshot *forecastDayThreeSnapshot    = [weatherData.forecastSnapshots objectAtIndex:2];
    
    // Set the weather view's forcast day labels
    self.weatherView.forecastDayOneLabel.text    = [forecastDayOneSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)];
    self.weatherView.forecastDayTwoLabel.text    = [forecastDayTwoSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)];
    self.weatherView.forecastDayThreeLabel.text  = [forecastDayThreeSnapshot.dayOfWeek substringWithRange:NSMakeRange(0, 3)];
    
    // Set the weather view's forecast icons
    self.weatherView.forecastIconOneLabel.text   = forecastDayOneSnapshot.icon;
    self.weatherView.forecastIconTwoLabel.text   = forecastDayTwoSnapshot.icon;
    self.weatherView.forecastIconThreeLabel.text = forecastDayThreeSnapshot.icon;
    
    // Set the weather view's background color
    CGFloat fahrenheit = MIN(MAX(0, currentTemperature.fahrenheit), 99);
    NSString *gradientImageName = [NSString stringWithFormat:@"gradient%d.png", (int)floor(fahrenheit / 10.0)];
    self.weatherView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:gradientImageName]];
}

@end
