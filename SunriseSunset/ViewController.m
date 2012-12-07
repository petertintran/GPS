//
//  ViewController.m
//  SunriseSunsetGPS
//
//  Created by Peter Tran on 26/11/2012.
//  Code given by Michael Shafae
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//
//  Code for calculating current Latitude and Longitude was retrieved from: http://www.appcoda.com/how-to-get-current-location-iphone-user/
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CLLocationManager *locationManager;
}

@synthesize labelLong = _labelLong;
@synthesize labelLat = _labelLat;
@synthesize labelSunrise = _labelSunrise;
@synthesize labelSunset =_labelSunset;

@synthesize buttonCalc = _buttonCalc;
@synthesize imageCurrentSun = _imageCurrentSun;
@synthesize imageCurrentMoon = _imageCurrentMoon;

//Variables for current Lat and Lon
double CurrentLat;
double CurrentLon;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];
    self.buttonCalc.enabled = FALSE;
    
    //Load Images
    _imageCurrentSun.image = [UIImage imageNamed:@"Sun.png"];
    _imageCurrentMoon.image = [UIImage imageNamed:@"Moon.png"];
    
}

-(IBAction)getCurrentLocation:(id)sender
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    self.buttonCalc.enabled = TRUE;
}

#pragma mark - CCLocationManagerDelegate

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //Display error if the user's current location cannot be found
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle: @"Error " message: @"Failed to Get Your Location" delegate:nil cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [errorAlert show];
}

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLoaction: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    //Prints user current location and stores Lat and Lon for later calculations
    if(currentLocation != nil)
    {
        self.labelLong.text = [NSString stringWithFormat:@"%.4f", currentLocation.coordinate.longitude];
        CurrentLon = currentLocation.coordinate.longitude;
        self.labelLat.text = [NSString stringWithFormat:@"%.4f", currentLocation.coordinate.latitude];
        CurrentLat = currentLocation.coordinate.latitude;
    }
    
    //Disables refreshing of current location every second
    [locationManager stopUpdatingLocation];
}

#pragma mark - Calculations

- (IBAction)calculateSunriseSunset:(id)sender
{
    time_t now;
    struct tm* timeinfo;
    
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
    double sunrise = calculateSunriseOrSunset( timeinfo, CurrentLat, CurrentLon, OFFICIAL, YES );
    double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
    double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
    
    double sunset = calculateSunriseOrSunset( timeinfo, CurrentLat, CurrentLon, OFFICIAL, NO );
    double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
    double sunset_m = round((sunset - floor(sunset)) * 60.0 );
    
    //Prints calculated sunrise and sunset to labels
    self.labelSunrise.text = [NSString stringWithFormat:@"%g:%02g AM", sunrise_h, sunrise_m ];
    self.labelSunset.text = [NSString stringWithFormat:@"%g:%02g PM", sunset_h, sunset_m ];
}


- (void)viewDidUnload
{
    [self setLabelSunrise:nil];
    [self setLabelSunset:nil];
    [self setLabelLong:nil];
    [self setLabelLat:nil];
    [self setButtonCalc:nil];
    [self setImageCurrentSun:nil];
    [self setImageCurrentMoon:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
