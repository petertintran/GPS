//
//  SearchViewController.h
//  SunriseSunset
//
//  Created by Peter Tran on 11/26/12.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "USLocationsDatabase.h"

@interface SearchViewController : UITableViewController
{
    NSArray * _arrayStates;
    NSArray * _arrayAbvStates;
    NSArray * _locations;
    IBOutlet UITableView *tableView;
    
}

@property (nonatomic, retain) NSArray * arrayStates;
@property (nonatomic, retain) NSArray * arrayAbvStates;
@property (nonatomic, retain) NSArray * locations;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
