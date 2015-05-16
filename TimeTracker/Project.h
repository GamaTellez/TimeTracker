//
//  Project.h
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

@import Foundation;
#import "WorkPeriod.h"


@interface Project : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic, readonly) NSArray *workPeriodsArray;

- (void)addWorkPeriod:(WorkPeriod *)workPeriod;
- (void)removeWorkPeriod:(WorkPeriod *)workPeriod;
- (NSTimeInterval)calculateProjectTime;

@end