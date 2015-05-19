//
//  ProjectController.h
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project+Helper.h"
#import "WorkPeriod+Helper.h"

@interface ProjectController : NSObject

+ (instancetype)sharedInstance;

//Create
- (Project *)createProject;

//Retrieve
@property (strong, nonatomic, readonly) NSArray *projectsArray;

//Update
- (void)save;

//Delete
- (void)deleteProject:(Project *)project;


//Create
- (WorkPeriod *)createWorkPeriodInProject:(Project *)project;

//Retrieve
//Not needed because it is a property on your project, so just query the project

//Update
//Not needed, the beauty of pointers

//Delete
- (void)deleteWorkPeriod:(WorkPeriod *)workPeriod;

@end