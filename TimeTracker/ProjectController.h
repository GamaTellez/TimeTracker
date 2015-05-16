//
//  ProjectController.h
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ProjectController : NSObject

@property (strong, nonatomic, readonly) NSArray *projectsArray;

+ (instancetype)sharedInstance;

- (void)addProject:(Project *)project;
- (void)deleteProject:(Project *)project;

@end