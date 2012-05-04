//
//  WSLesson.m
//  iOS Workshop
//
//  Created by Kyle Turner on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WSLesson.h"


/* List of Sample Workshop Lessons (Titles and URLs):
 
 Installing Tools: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/GetToolsInstall/GetToolsandInstall.html
 Writing Objective-C: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/Languages/WriteObjective-CCode/WriteObjective-CCode/WriteObjective-CCode.html
 Working w/ the Core Foundation: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/BasicTasks/AcquireBasicProgrammingSkills/AcquireBasicSkills/AcquireBasicSkills.html
 Integrating w/ Frameworks: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/Frameworks/RM_ProgramWithFrameworks/IntegrateYourCode/IntegrateYourCode.html
 Design w/ the User in Mind: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/HumanInterfaceDesign/RM_iHIG_Station/Fundamentals/Fundamentals.html
 Core Objects of an App: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/ApplicationDesign/KnowtheCoreObjectsofYourApp/KnowCoreAppObjects/KnowCoreAppObjects.html
 What Now?: https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/WhereToGo/WhereToGo.html
 
 */


@implementation WSLesson

@synthesize title = _title;
@synthesize url = _url;

+ (NSArray *)workshopLessons
{
    WSLesson *lesson1 = [WSLesson new];
    lesson1.title = @"Writing Objective-C";
    lesson1.url = [NSURL URLWithString:@"https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/Languages/WriteObjective-CCode/WriteObjective-CCode/WriteObjective-CCode.html"];
    
    WSLesson *lesson2 = [WSLesson new];
    lesson2.title = @"Working w/ the Core Foundation";
    lesson2.url = [NSURL URLWithString:@"https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/BasicTasks/AcquireBasicProgrammingSkills/AcquireBasicSkills/AcquireBasicSkills.html"];
    
    WSLesson *lesson3 = [WSLesson new];
    lesson3.title = @"Integrating w/ Frameworks";
    lesson3.url = [NSURL URLWithString:@"https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/Frameworks/RM_ProgramWithFrameworks/IntegrateYourCode/IntegrateYourCode.html"];
    
    WSLesson *lesson4 = [WSLesson new];
    lesson4.title = @"Design w/ the User in Mind";
    lesson4.url = [NSURL URLWithString:@"https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/HumanInterfaceDesign/RM_iHIG_Station/Fundamentals/Fundamentals.html"];
    
    WSLesson *lesson5 = [WSLesson new];
    lesson5.title = @"What Now?";
    lesson5.url = [NSURL URLWithString:@"https://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/WhereToGo/WhereToGo.html"];
    
    return [[NSArray alloc] initWithObjects:lesson1, lesson2, lesson3, lesson4, lesson5, nil];
}

@end