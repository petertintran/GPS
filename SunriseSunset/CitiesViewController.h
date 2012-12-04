//
//  CitiesViewController.h
//  SunriseSunset
//
//  Created by Peter Tran on 11/28/12.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "USLocationsDatabase.h"


@interface CitiesViewController : UITableViewController
{

    NSArray * _locations;
    IBOutlet UITableView *tableView;
    
}

@property USLocationsDatabase *USLoc;

@property (nonatomic, retain) NSArray * locations;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSString * selectedState;
@property (assign) int selectedStateIndex;
@end
