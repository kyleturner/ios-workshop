//
//  WSAboutViewController.m
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WSSecretsViewController.h"


@interface WSSecretsViewController ()

@end

@implementation WSSecretsViewController

@synthesize workshopBarButtonItem = _workshopBarButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setWorkshopBarButtonItem:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtu.be/oHg5SJYRHA0?t=0s&autoplay=1"]];
        return NO;
    }
    else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);        
    }
}

- (IBAction)workshopButtonTapped:(id)sender 
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
