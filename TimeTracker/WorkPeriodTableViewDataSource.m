//
//  WorkPeriodTableViewDataSource.m
//  TimeTracker
//
//  Created by Taylor Mott on 16 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "WorkPeriodTableViewDataSource.h"

static NSString *cellID = @"cellID";

@implementation WorkPeriodTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.project.workPeriodsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    WorkPeriod *workPeriod = self.project.workPeriodsArray[indexPath.row];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *startDateString = [dateFormatter stringFromDate:workPeriod.startDate];
    NSString *endDateString = [dateFormatter stringFromDate:workPeriod.endDate];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ to %@", startDateString, endDateString];
    cell.detailTextLabel.text = workPeriod.memo;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        WorkPeriod *workPeriod = self.project.workPeriodsArray[indexPath.row];
        [self.project deleteWorkPeriod:workPeriod];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end