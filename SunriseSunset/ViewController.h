//
//  ViewController.h
//  SunriseSunsetGPS
//
//  Created by Peter Tran on 26/11/2012.
//  Code given by Michael Shafae
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MacSunrise.h"

#import "CoreLocationController.h"




@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    IBOutlet UILabel* _labelSunrise;
    IBOutlet UILabel* _labelSunset;
    IBOutlet UILabel* _labelLong;
    IBOutlet UILabel* _labelLat;
    
    IBOutlet UIButton* _buttonCalc;

    CoreLocationController *CLController;
}

@property (nonatomic, retain) CoreLocationController *CLController;

@property (strong, nonatomic) IBOutlet UILabel *labelSunrise;
@property (strong, nonatomic) IBOutlet UILabel *labelSunset;
@property (strong, nonatomic) IBOutlet UILabel *labelLong;
@property (strong, nonatomic) IBOutlet UILabel *labelLat;
@property (strong, nonatomic) IBOutlet UIButton *buttonCalc;
@property (strong, nonatomic) IBOutlet UIImageView *imageCurrentSun;
@property (strong, nonatomic) IBOutlet UIImageView *imageCurrentMoon;


- (IBAction)getCurrentLocation:(id)sender;
- (IBAction)calculateSunriseSunset:(id)sender;


@end
