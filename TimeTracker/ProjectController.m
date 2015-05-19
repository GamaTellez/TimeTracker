//
//  ProjectController.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectController.h"
#import "Stack.h"

@interface ProjectController()

@property (strong, nonatomic) NSArray *projectsArray;

@end

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
        sharedInstance.projectsArray = [NSArray new];
    });
    
    return sharedInstance;
}

//Create
- (Project *)createProject
{
    return [NSEntityDescription insertNewObjectForEntityForName:projectClassString inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
}

//Retrieve
- (NSArray *)projectsArray
{
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:projectClassString] error:nil];
}

//Update
- (void)save
{
    [[Stack sharedInstance].managedObjectContext save:nil];
}

//Delete
- (void)deleteProject:(Project *)project
{
    [project.managedObjectContext deleteObject:project];
    [self save];
}


//Create
- (WorkPeriod *)createWorkPeriodInProject:(Project *)project
{
    WorkPeriod *workPeriod = [NSEntityDescription insertNewObjectForEntityForName:workPeriodClassString inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    workPeriod.project = project;
    return workPeriod;
}

//Retrieve
//Not needed because it is a property on your project, so just query the project

//Update
//Not needed, the beauty of pointers

//Delete
- (void)deleteWorkPeriod:(WorkPeriod *)workPeriod
{
    [workPeriod.managedObjectContext deleteObject:workPeriod];
    [self save];
}



@end