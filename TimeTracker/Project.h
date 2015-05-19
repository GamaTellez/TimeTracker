//
//  Project.h
//  TimeTracker
//
//  Created by Taylor Mott on 19 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Project : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *workPeriods;
@end

@interface Project (CoreDataGeneratedAccessors)

- (void)addWorkPeriodsObject:(NSManagedObject *)value;
- (void)removeWorkPeriodsObject:(NSManagedObject *)value;
- (void)addWorkPeriods:(NSSet *)values;
- (void)removeWorkPeriods:(NSSet *)values;

@end
