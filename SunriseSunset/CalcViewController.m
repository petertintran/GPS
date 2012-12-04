//
//  CalcViewController.m
//  SunriseSunset
//
//  Created by Peter Tran on 02/12/2012.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import "CalcViewController.h"
#import "CitiesViewController.h"

@interface CalcViewController ()

@end

@implementation CalcViewController

@synthesize labelState = _labelState;
@synthesize labelCity = _labelCity;
@synthesize labelCalcSunrise = _labelCalcSunrise;
@synthesize labelCalcSunset = _labelCalcSunset;

//Values recieved from CityViewController
@synthesize passedState;
@synthesize passedCity;
@synthesize passedLong;
@synthesize passedLat;
@synthesize passedStateInd;

//Images
@synthesize imageSun = _imageSun;
@synthesize imageMoon = _imageMoon;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    time_t now;
    struct tm* timeinfo;
    
    // User selected Lat and Lon
    double lat = passedLong;
    double lon = passedLat;
    
    //Load Images
    _imageSun.image = [UIImage imageNamed:@"Sun.png"];
    _imageMoon.image = [UIImage imageNamed:@"Moon.png"];
    
    //Variable Checking
    //NSLog(@"Passed Lat: %f", lat);
    //NSLog(@"Passed Long: %f", lon);
 
    //Input text of user selected state and city to labels
    self.labelState.text = self.passedState;
    self.labelCity.text = self.passedCity;
    
    
    time( &now );
    timeinfo = localtime( &now );
    BOOL flag = NO;
    if( flag ){
        // In case you want to check the sunrise and sunset times for
        // 7/25/1990 set flag to YES.
        timeinfo->tm_mon = 9;
        timeinfo->tm_mday = 31;
        timeinfo->tm_year = 12;
    }
    printf ( "Current local time and date: %s", asctime(timeinfo) );
    
    NSLog( @"Sunrise & sunset with civil zenith\n" );
    double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, YES );
    double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
    double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
    
    double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, NO );
    double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
    double sunset_m = round((sunset - floor(sunset)) * 60.0 );
    
    //Prints calculated sunrise and sunset to labels
    self.labelCalcSunrise.text = [NSString stringWithFormat:@"%g:%02g AM", sunrise_h, sunrise_m ];
    self.labelCalcSunset.text = [NSString stringWithFormat:@"%g:%02g PM", sunset_h, sunset_m ];
    
}

- (void)viewDidUnload
{
    self.labelState = nil;
    self.labelCity = nil;
    self.labelCalcSunrise = nil;
    self.labelCalcSunset = nil;
    [self setImageSun:nil];
    [self setImageMoon:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"returnIndex"])
    {
        
        CitiesViewController *destViewController = segue.destinationViewController;
        destViewController.selectedStateIndex = passedStateInd;
    }
}
@end
