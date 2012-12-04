//
//  CalcViewController.h
//  SunriseSunset
//
//  Created by Peter Tran on 02/12/2012.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacSunrise.h"

@interface CalcViewController : UIViewController
{
    IBOutlet UILabel * _labelState;
    IBOutlet UILabel * _labelCity;
    IBOutlet UILabel * _labelCalcSunrise;
    IBOutlet UILabel * _labelCalcSunset;

}

@property (strong, nonatomic) IBOutlet UILabel *labelState;
@property (strong, nonatomic) IBOutlet UILabel *labelCity;
@property (strong, nonatomic) IBOutlet UILabel *labelCalcSunrise;
@property (strong, nonatomic) IBOutlet UILabel *labelCalcSunset;

@property (assign) NSString* passedState;
@property (assign) NSString* passedCity;
@property (assign) double passedLong;
@property (assign) double passedLat;
@property (assign) int passedStateInd;

@property (strong, nonatomic) IBOutlet UIImageView *imageSun;
@property (strong, nonatomic) IBOutlet UIImageView *imageMoon;

@end
