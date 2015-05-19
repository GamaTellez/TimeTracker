//
//  Project.h
//  TimeTracker
//
//  Created by Taylor Mott on 19 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WorkPeriod;

@interface Project : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSOrderedSet *workPeriods;
@end

@interface Project (CoreDataGeneratedAccessors)

- (void)insertObject:(WorkPeriod *)value inWorkPeriodsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromWorkPeriodsAtIndex:(NSUInteger)idx;
- (void)insertWorkPeriods:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeWorkPeriodsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInWorkPeriodsAtIndex:(NSUInteger)idx withObject:(WorkPeriod *)value;
- (void)replaceWorkPeriodsAtIndexes:(NSIndexSet *)indexes withWorkPeriods:(NSArray *)values;
- (void)addWorkPeriodsObject:(WorkPeriod *)value;
- (void)removeWorkPeriodsObject:(WorkPeriod *)value;
- (void)addWorkPeriods:(NSOrderedSet *)values;
- (void)removeWorkPeriods:(NSOrderedSet *)values;
@end
