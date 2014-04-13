//
//  SOLWeatherViewController.m
//  Sol
//
//  Created by Comyar Zaheri on 4/13/14.
//  Copyright (c) 2014 Comyar Zaheri. All rights reserved.
//

#import "SOLWeatherViewController.h"
#import "SOLWeatherView.h"

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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.weatherView = ({
        SOLWeatherView *weatherView = [[SOLWeatherView alloc]initWithFrame:self.view.bounds];
        weatherView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:kDefaultBackgroundGradientName]];
        weatherView;
    });
    [self.view addSubview:self.weatherView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
