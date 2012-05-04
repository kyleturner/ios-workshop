//
//  WSAppDelegate.h
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 Night Owl, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WSAppDelegate : UIResponder <UIApplicationDelegate> // @interface ClassName : Subclass <Protocol>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
