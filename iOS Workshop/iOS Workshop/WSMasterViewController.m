//
//  WSMasterViewController.m
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 Night Owl, LLC. All rights reserved.
//

#import "WSMasterViewController.h"
// KYLE: REMOVE THIS
#import "WSSecretsViewController.h" 
#import "WSDomain.h"


// private interfaces allow for private instance variables, as well as @properties to be defined (unlike categories)
@interface WSMasterViewController () 
{
    NSArray *_workshopLessons;
}

- (void)secretsButtonTapped:(id)sender;

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

    // KYLE: REMOVE THIS...
    UIBarButtonItem *secretsButton = [[UIBarButtonItem alloc] initWithTitle:@"Secrets" style:UIBarButtonItemStyleBordered target:self action:@selector(secretsButtonTapped:)];
    self.navigationItem.rightBarButtonItem = secretsButton;
    
    // convenience method on WSLesson to generate a list of available workshop lessons
    _workshopLessons = [WSLesson workshopLessons];
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

/*
 viewDidAppear: is called right when the view is displayed on screen.
 Use viewDidAppear: to start network requests, or begin animations you wish the user to see.
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

/*
 viewDidUnload is called once after the view has unloaded.  
 This is for setting any UIView pointers to nil and cleaning up unneeded objects.
 */
- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (void)secretsButtonTapped:(id)sender
{
    // TODO: You have a WSSecretsViewController class.  Allocate and initialize secretsViewController when the secretsButton is tapped.
    WSSecretsViewController *secretsViewController = [[WSSecretsViewController alloc] initWithNibName:@"WSSecretsViewController" bundle:nil];
    secretsViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // TODO: use your navigation controller to PRESENT secretsViewController modally!
    [self.navigationController presentModalViewController:secretsViewController animated:YES];
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
    
    // TODO1: Determine which WSLesson from the workshopsLessonArray should populate the cell.
    //       Populate each table cell’s label text with a WSLesson’s title.

    WSLesson *lesson = [_workshopLessons objectAtIndex:indexPath.row]; // KYLE: REMOVE THIS
    cell.textLabel.text = lesson.title; // KYLE: REMOVE THIS
    
    return cell;
}

#pragma mark - Table view delegate

// Delegate method called when a user taps on a particular table cell at a given indexPath (section, row)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // creates a detail view controller, if one doesn't already exist
    if (!self.detailViewController) {
        self.detailViewController = [[WSDetailViewController alloc] initWithNibName:@"WSDetailViewController" bundle:nil];
    }
    
    // TODO: A detail view controller has a "lesson" object.  Set the detailViewController's lesson to the lesson
    //       that was selected at the selected indexPath, before pushing on the view.
    WSLesson *lesson = [_workshopLessons objectAtIndex:indexPath.row];
    self.detailViewController.lesson = lesson;
    
    // TODO: use your navigation controller to PUSH the detailViewController onto the stack
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
