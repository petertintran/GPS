//
//  SearchViewController.m
//  SunriseSunset
//
//  Created by Peter Tran on 11/26/12.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import "SearchViewController.h"
#import "CitiesViewController.h"


@interface SearchViewController ()

@end

@implementation SearchViewController

@synthesize tableView;
@synthesize arrayStates = _arrayStates;
@synthesize arrayAbvStates = _arrayAbvStates;


- (void)viewDidLoad
{
    [super viewDidLoad];

    //Arrays for the States and State Abreviations
    self.arrayStates = [[NSArray alloc] initWithObjects:
                        @"Alabama",
                        @"Alaska",
                        @"Arizona",
                        @"Arkansas",
                        @"California",
                        @"Colorado",
                        @"Connecticut",
                        @"Delaware",
                        @"Florida",
                        @"Georgia",
                        @"Hawaii",
                        @"Idaho",
                        @"Illinois",
                        @"Indiana",
                        @"Iowa",
                        @"Kansas",
                        @"Kentucky",
                        @"Louisana",
                        @"Maine",
                        @"Maryland",
                        @"Massachusetts",
                        @"Michigan",
                        @"Minnesota",
                        @"Missisippi",
                        @"Missouri",
                        @"Montana",
                        @"Nebraska",
                        @"Nevada",
                        @"New Hampshire",
                        @"New Jersey",
                        @"New Mexico",
                        @"New York",
                        @"North Carolina",
                        @"North Dakota",
                        @"Ohio",
                        @"Oklahoma",
                        @"Oregon",
                        @"Pennsylvania",
                        @"Rhode Island",
                        @"South Carolina",
                        @"South Dakota",
                        @"Tennessee",
                        @"Texas",
                        @"Utah",
                        @"Vermont",
                        @"Virgina",
                        @"Washington",
                        @"West Virgina",
                        @"Wisconsin",
                        @"Wyoming",
                        nil];
    self.arrayAbvStates = [[NSArray alloc] initWithObjects:
                           @"US/AL",
                           @"US/AK",
                           @"US/AZ",
                           @"US/AR",
                           @"US/CA",
                           @"US/CO",
                           @"US/CT",
                           @"US/DE",
                           @"US/FL",
                           @"US/GA",
                           @"US/HI",
                           @"US/ID",
                           @"US/IL",
                           @"US/IN",
                           @"US/IA",
                           @"US/KS",
                           @"US/KY",
                           @"US/LA",
                           @"US/ME",
                           @"US/MD",
                           @"US/MA",
                           @"US/MI",
                           @"US/MN",
                           @"US/MS",
                           @"US/MO",
                           @"US/MT",
                           @"US/NE",
                           @"US/NV",
                           @"US/NH",
                           @"US/NJ",
                           @"US/NM",
                           @"US/NY",
                           @"US/NC",
                           @"US/ND",
                           @"US/OH",
                           @"US/OK",
                           @"US/OR",
                           @"US/PA",
                           @"US/RI",
                           @"US/SC",
                           @"US/SD",
                           @"US/TN",
                           @"US/TX",
                           @"US/UT",
                           @"US/VT",
                           @"US/VA",
                           @"US/WA",
                           @"US/WV",
                           @"US/WI",
                           @"US/WY",
                           nil];

}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.arrayStates = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.arrayStates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //Check to see if we can reuse a cell
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //If there are no cells to reuse we create a new one
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    //Adds a detail view accessory
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    //Adjust cell size for readable text
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    //Fill in the cell with text from array(States and its Abbreviations)
    cell.textLabel.text = [self.arrayStates objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.arrayAbvStates objectAtIndex:indexPath.row];

    //Returns the cell
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showStateSelection"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CitiesViewController *destViewController = segue.destinationViewController;
        destViewController.selectedStateIndex = indexPath.row;
    }
}

@end
