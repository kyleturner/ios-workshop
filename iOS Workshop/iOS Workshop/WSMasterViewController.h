//
//  WSMasterViewController.h
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 Night Owl, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSDetailViewController.h"


@interface WSMasterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) WSDetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
