//
//  CitiesViewController.h
//  SunriseSunsetGPS
//
//  Created by Peter Tran on 11/28/12.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "USLocationsDatabase.h"


@interface CitiesViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{

    NSArray * _locations;
    IBOutlet UITableView *tableView;
    
    //For use in creating sections
    NSMutableArray *sectionsArray;
    UILocalizedIndexedCollation *collation;
    
}


@property (nonatomic, retain) NSArray * locations;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSString * selectedState;
@property (assign) int selectedStateIndex;

@property (nonatomic, retain) NSArray * sectionsArray;
@property (nonatomic, retain) UILocalizedIndexedCollation* collation;

- (void) configureSections;
- (void) setLocations:(NSArray *)newDataArray;

@end
