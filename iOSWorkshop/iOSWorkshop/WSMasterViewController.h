//
//  WSMasterViewController.h
//  iOSWorkshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSDetailViewController;

@interface WSMasterViewController : UITableViewController

@property (strong, nonatomic) WSDetailViewController *detailViewController;

@end
