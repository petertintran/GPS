//
//  CoreLocationController.m
//  SunriseSunset
//
//  Created by Lion User on 04/12/2012.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import "CoreLocationController.h"

@implementation CoreLocationController

@synthesize locMgr = _locMgr;
@synthesize delegate = _delegate;


- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)])
    {
        [self.delegate locationUpdate:newLocation];
    }
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)])
    {
        [self.delegate locationError:error];
    }
}

@end
