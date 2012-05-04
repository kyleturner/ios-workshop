//
//  WSDetailViewController.h
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 Night Owl, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSDomain.h"


@interface WSDetailViewController : UIViewController

@property (strong, nonatomic) WSLesson *lesson;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
