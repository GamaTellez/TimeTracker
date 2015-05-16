//
//  Project.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "Project.h"

@interface Project()

@property (strong, nonatomic) NSArray *workPeriodsArray;

@end

@implementation Project

- (void)addWorkPeriod:(WorkPeriod *)workPeriod
{
    NSMutableArray *mutableWorkPeriodArray = [self.workPeriodsArray mutableCopy];
    
    [mutableWorkPeriodArray addObject:workPeriod];
    
    self.workPeriodsArray = [mutableWorkPeriodArray copy];
}

- (void)removeWorkPeriod:(WorkPeriod *)workPeriod
{
    NSMutableArray *mutableWorkPeriodArray = [self.workPeriodsArray mutableCopy];
    
    [mutableWorkPeriodArray removeObject:workPeriod];
    
    self.workPeriodsArray = [mutableWorkPeriodArray copy];
}

- (NSTimeInterval)calculateProjectTime
{
    NSTimeInterval totalTime = 0;
    
    for (WorkPeriod *workPeriod in self.workPeriodsArray)
    {
        NSTimeInterval workPeriodLength = [workPeriod.endDate timeIntervalSinceDate:workPeriod.startDate];
        totalTime += workPeriodLength;
    }
    
    return totalTime;
}

@end