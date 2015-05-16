//
//  ProjectController.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectController.h"

@interface ProjectController()

@property (strong, nonatomic) NSArray *projectsArray;

@end

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
    });
    
    return sharedInstance;
}

- (void)addProject:(Project *)project
{
    NSMutableArray *mutableProjectsArray = [self.projectsArray mutableCopy];
    
    [mutableProjectsArray addObject:project];
    
    self.projectsArray = [mutableProjectsArray copy];
}

- (void)deleteProject:(Project *)project
{
    NSMutableArray *mutableProjectsArray = [self.projectsArray mutableCopy];
    
    [mutableProjectsArray removeObject:project];
    
    self.projectsArray = [mutableProjectsArray copy];
}



@end