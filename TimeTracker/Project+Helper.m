//
//  Project+Helper.m
//  TimeTracker
//
//  Created by Taylor Mott on 19 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "Project+Helper.h"
#import "WorkPeriod+Helper.h"

@implementation Project (Helper)

- (NSTimeInterval)calculateProjectTime
{
    NSTimeInterval totalTime = 0;
    
    for (WorkPeriod *workPeriod in self.workPeriods)
    {
        NSTimeInterval workPeriodLength = [workPeriod.endDate timeIntervalSinceDate:workPeriod.startDate];
        totalTime += workPeriodLength;
    }
    
    return totalTime;
}

- (NSString *)totalProjectTimeString
{
    NSTimeInterval totalNumberOfSeconds = [self calculateProjectTime];
    
    NSInteger numberOfHours =  floor(totalNumberOfSeconds / 3600);
    
    NSInteger numberOfSecondsRemaining = totalNumberOfSeconds - (numberOfHours * 3600);
    
    NSInteger numberOfMinutes = floor(numberOfSecondsRemaining / 60);
    
    numberOfSecondsRemaining = numberOfSecondsRemaining - (numberOfMinutes * 60);
    
    NSString *secondsString;
    if (numberOfSecondsRemaining < 10)
    {
        secondsString = [NSString stringWithFormat:@"0%ld", (long)numberOfSecondsRemaining];
    }
    else
    {
        secondsString = [NSString stringWithFormat:@"%ld", (long)numberOfSecondsRemaining];
    }
    
    NSString *minutesString;
    if (numberOfMinutes < 10)
    {
        minutesString = [NSString stringWithFormat:@"0%ld", (long)numberOfMinutes];
    }
    else
    {
        minutesString = [NSString stringWithFormat:@"%ld", (long)numberOfMinutes];
    }
    
    return [NSString stringWithFormat:@"%ld:%@:%@", (long)numberOfHours, minutesString, secondsString];
}

@end
