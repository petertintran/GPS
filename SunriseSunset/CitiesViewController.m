//
//  CitiesViewController.m
//  SunriseSunset
//
//  Created by Peter Tran on 11/28/12.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import "CitiesViewController.h"
#import "CalcViewController.h"

@interface CitiesViewController ()

@end

@implementation CitiesViewController

@synthesize USLoc = _USLoc;


@synthesize tableView;

@synthesize locations = _locations;

@synthesize selectedStateIndex = _selectedStateIndex;
@synthesize selectedState;




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Determines what States the user has selected
    if(self.selectedStateIndex == 0)
    {
        self.selectedState = @"AL";
    }
    else if(self.selectedStateIndex == 1)
    {
        self.selectedState = @"AK";
    }
    else if(self.selectedStateIndex == 2)
    {
        self.selectedState = @"AZ";
    }
    else if(self.selectedStateIndex == 3)
    {
        self.selectedState = @"AR";
    }
    else if(self.selectedStateIndex == 4)
    {
        self.selectedState = @"CA";
    }
    else if(self.selectedStateIndex == 5)
    {
        self.selectedState = @"CO";
    }
    else if(self.selectedStateIndex == 6)
    {
        self.selectedState = @"CT";
    }
    else if(self.selectedStateIndex == 7)
    {
        self.selectedState = @"DE";
    }
    else if(self.selectedStateIndex == 8)
    {
        self.selectedState = @"FL";
    }
    else if(self.selectedStateIndex == 9)
    {
        self.selectedState = @"GA";
    }
    else if(self.selectedStateIndex == 10)
    {
        self.selectedState = @"HI";
    }
    else if(self.selectedStateIndex == 11)
    {
        self.selectedState = @"ID";
    }
    else if(self.selectedStateIndex == 12)
    {
        self.selectedState = @"AK";
    }
    else if(self.selectedStateIndex == 13)
    {
        self.selectedState = @"IN";
    }
    else if(self.selectedStateIndex == 14)
    {
        self.selectedState = @"IA";
    }
    else if(self.selectedStateIndex == 15)
    {
        self.selectedState = @"KS";
    }
    else if(self.selectedStateIndex == 16)
    {
        self.selectedState = @"KY";
    }
    else if(self.selectedStateIndex == 17)
    {
        self.selectedState = @"LA";
    }
    else if(self.selectedStateIndex == 18)
    {
        self.selectedState = @"ME";
    }
    else if(self.selectedStateIndex == 19)
    {
        self.selectedState = @"MD";
    }
    else if(self.selectedStateIndex == 20)
    {
        self.selectedState = @"MA";
    }
    else if(self.selectedStateIndex == 21)
    {
        self.selectedState = @"MI";
    }
    else if(self.selectedStateIndex == 22)
    {
        self.selectedState = @"MN";
    }
    else if(self.selectedStateIndex == 23)
    {
        self.selectedState = @"MS";
    }
    else if(self.selectedStateIndex == 24)
    {
        self.selectedState = @"MO";
    }
    else if(self.selectedStateIndex == 25)
    {
        self.selectedState = @"MT";
    }
    else if(self.selectedStateIndex == 26)
    {
        self.selectedState = @"NE";
    }
    else if(self.selectedStateIndex == 27)
    {
        self.selectedState = @"NV";
    }
    else if(self.selectedStateIndex == 28)
    {
        self.selectedState = @"NH";
    }
    else if(self.selectedStateIndex == 29)
    {
        self.selectedState = @"NJ";
    }
    else if(self.selectedStateIndex == 30)
    {
        self.selectedState = @"NM";
    }
    else if(self.selectedStateIndex == 31)
    {
        self.selectedState = @"NY";
    }
    else if(self.selectedStateIndex == 32)
    {
        self.selectedState = @"NC";
    }
    else if(self.selectedStateIndex == 33)
    {
        self.selectedState = @"ND";
    }
    else if(self.selectedStateIndex == 34)
    {
        self.selectedState = @"OH";
    }
    else if(self.selectedStateIndex == 35)
    {
        self.selectedState = @"OK";
    }
    else if(self.selectedStateIndex == 36)
    {
        self.selectedState = @"OR";
    }
    else if(self.selectedStateIndex == 37)
    {
        self.selectedState = @"PA";
    }
    else if(self.selectedStateIndex == 38)
    {
        self.selectedState = @"RI";
    }
    else if(self.selectedStateIndex == 39)
    {
        self.selectedState = @"SC";
    }
    else if(self.selectedStateIndex == 40)
    {
        self.selectedState = @"SD";
    }
    else if(self.selectedStateIndex == 41)
    {
        self.selectedState = @"TN";
    }
    else if(self.selectedStateIndex == 42)
    {
        self.selectedState = @"TX";
    }
    else if(self.selectedStateIndex == 43)
    {
        self.selectedState = @"UT";
    }
    else if(self.selectedStateIndex == 44)
    {
        self.selectedState = @"VT";
    }
    else if(self.selectedStateIndex == 45)
    {
        self.selectedState = @"VA";
    }
    else if(self.selectedStateIndex == 46)
    {
        self.selectedState = @"WA";
    }
    else if(self.selectedStateIndex == 47)
    {
        self.selectedState = @"WV";
    }
    else if(self.selectedStateIndex == 48)
    {
        self.selectedState = @"WI";
    }
    else if(self.selectedStateIndex == 49)
    {
        self.selectedState = @"WY";
    }
    
    //Variable Checking
    //NSLog(@"State Index is %i", self.selectedStateIndex);
    //NSLog(@"State is %@", self.selectedState);
    
    //Passes the user-selected state to USLocationDatabase
    self.locations = [[USLocationsDatabase database] someLocations: self.selectedState];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.locations = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [self.locations count];
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
    
    //Fill in the cell with text from Database
    Location *location = [self.locations objectAtIndex: indexPath.row];
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%g, %g)", location.region, location.coord->longitude, location.coord->latitude];
    
    //Returns the cell
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showCitySelection"])
    {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Location *location = [self.locations objectAtIndex: indexPath.row];
        CalcViewController *destViewController = segue.destinationViewController;
        destViewController.passedState = self.selectedState;
        destViewController.passedLong = location.coord->longitude;
        destViewController.passedLat = location.coord->latitude;
        destViewController.passedCity = location.name;
        destViewController.passedStateInd = self.selectedStateIndex;
        
        //Variable Checking
        //NSLog(@"State: %@", destViewController.passedState);
        //NSLog(@"City: %@", destViewController.passedCity);
        //NSLog(@"Long: %f", destViewController.passedLong);
        //NSLog(@"Lat: %f", destViewController.passedLat);
    }
}

@end
