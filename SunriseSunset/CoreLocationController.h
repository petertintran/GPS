//
//  CoreLocationController.h
//  SunriseSunset
//
//  Created by Lion User on 04/12/2012.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol CoreLocationControllerDelegate 
@required
- (void) locationUpdate: (CLLocation *)currentLoc;
- (void) locationError: (NSError *)error;
@end


@interface CoreLocationController : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *locMgr;
    id delegate;
}

@property (nonatomic, retain) CLLocation *locMgr;
@property (nonatomic, assign) id delegate;

@end
