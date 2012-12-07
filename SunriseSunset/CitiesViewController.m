//
//  CitiesViewController.m
//  SunriseSunsetGPS
//
//  Created by Peter Tran on 11/28/12.
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//
//  Code for adding sections to table view retrieved from: https://developer.apple.com/library/ios/#samplecode/TableViewSuite/Introduction/Intro.html#//apple_ref/doc/uid/DTS40007318-Intro-DontLinkElementID_2
//

#import "CitiesViewController.h"
#import "CalcViewController.h"

@interface CitiesViewController ()

@end

@implementation CitiesViewController

@synthesize tableView;

@synthesize locations = _locations;

@synthesize selectedStateIndex = _selectedStateIndex;
@synthesize selectedState;

@synthesize sectionsArray;
@synthesize collation;


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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *citiesInSection = [sectionsArray objectAtIndex:section];
    return [citiesInSection count];
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
    
    //Creates an array for the specific section selected
    NSArray *citiesInSection = [sectionsArray objectAtIndex: indexPath.section];
    
    //Adds a detail view accessory
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    //Adjust cell size for readable text
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    //Fill in the cell with text from Database
    Location *citiesList = [citiesInSection objectAtIndex: indexPath.row];
    
    cell.textLabel.text = citiesList.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%g, %g)", citiesList.region, citiesList.coord->longitude, citiesList.coord->latitude];
    
    //Returns the cell
    return cell;
}

#pragma mark - Table view delegate

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

#pragma mark - Table view sections

//Code retrieved from http://develeoper.apple.com

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[collation sectionTitles] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[collation sectionTitles] objectAtIndex:section];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [collation sectionIndexTitles];
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [collation sectionForSectionIndexTitleAtIndex:index];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) configureSections
{
    //Gets reference to collation
    self.collation = [UILocalizedIndexedCollation currentCollation];
    
    NSInteger index;
    NSInteger sectionTitlesCount = [[collation sectionTitles] count];
    
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    
    //Creates the sections array
    for(index = 0; index < sectionTitlesCount; index++)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [newSectionsArray addObject:array];
    }
    
    //Divides the cities to its specific section
    for(Location* citiesList in self.locations)
    {
        //Uses collation to determine which section the city falls under
        NSInteger sectionNumber = [collation sectionForObject:citiesList collationStringSelector:@selector(name)];
        
        //Grabs the array for the specific section
        NSMutableArray *sectionCityNames = [newSectionsArray objectAtIndex:sectionNumber];
        
        //Add city to the current section
        [sectionCityNames addObject:citiesList];
    }
    
    //Sorts each section array made
    for(index = 0; index < sectionTitlesCount; index++)
    {
        NSMutableArray *citiesForSection = [newSectionsArray objectAtIndex:index];
        
        //
        NSArray *sortedCitiesSection = [collation sortedArrayFromArray:citiesForSection collationStringSelector:@selector(name)];
        
        //
        [newSectionsArray replaceObjectAtIndex:index withObject:sortedCitiesSection];
    }
    self.sectionsArray = newSectionsArray;
}


- (void)setLocations:(NSArray *)newDataArray
{
    if (newDataArray != _locations) {
        _locations = newDataArray;
    }
    if (_locations == nil) {
        self.sectionsArray = nil;
    }
    else {
        [self configureSections];
    }
}


@end
