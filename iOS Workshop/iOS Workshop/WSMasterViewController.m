//
//  WSMasterViewController.m
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 Night Owl, LLC. All rights reserved.
//

#import "WSMasterViewController.h"
#import "WSSecretsViewController.h"
#import "WSDomain.h"


// private interfaces allow for private instance variables, as well as @properties to be defined (unlike categories)
@interface WSMasterViewController () 
{
    NSArray *_workshopLessons;
}

- (void)populateWorkshopLessons;

@end

@implementation WSMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize tableView = _tableView;

#pragma mark - Memory management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Workshop", @"Workshop");
    }
    return self;
}

#pragma mark - View lifecycle

/*
 viewDidLoad is called once, and only once, when the view is initialized and displayed on screen.
 Use viewDidLoad for initial setup, such as laying out your UI, populating static data types, etc.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *secretsButton = [[UIBarButtonItem alloc] initWithTitle:@"Secrets" style:UIBarButtonItemStyleBordered target:self action:@selector(secretsButtonTapped:)];
    self.navigationItem.rightBarButtonItem = secretsButton;
    
    [self populateWorkshopLessons];
}

/*
 viewWillAppear: is called each time prior to displaying the view on screen.  
 Use viewWillAppear: to setup UI elements that you want populated before presenting to the user, such as
 a user's twitter handle.
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (void)secretsButtonTapped:(id)sender
{
    WSSecretsViewController *aboutViewController = [[WSSecretsViewController alloc] initWithNibName:@"WSSecretsViewController" bundle:nil];
    aboutViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController presentModalViewController:aboutViewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _workshopLessons.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *LessonCellIdentifier = @"LessonCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LessonCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LessonCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    WSLesson *lesson = [_workshopLessons objectAtIndex:indexPath.row];
    cell.textLabel.text = lesson.title;
    
    return cell;
}

#pragma mark - Table view delegate

// Delgate method called when a user taps on a particular table cell at a given indexPath (section, row)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[WSDetailViewController alloc] initWithNibName:@"WSDetailViewController" bundle:nil];
    }
    
    WSLesson *lesson = [_workshopLessons objectAtIndex:indexPath.row];
    
    self.detailViewController.lesson = lesson;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark - Private

- (void)populateWorkshopLessons
{
    WSLesson *lesson = [WSLesson new];
    lesson.title = @"Writing Objective-C";
    lesson.url = [NSURL URLWithString:@"https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/Languages/WriteObjective-CCode/WriteObjective-CCode/WriteObjective-CCode.html"];
    _workshopLessons = [[NSArray alloc] initWithObjects:lesson, nil];
}

@end
