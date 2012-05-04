//
//  WSDetailViewController.h
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 Night Owl, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WSDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
