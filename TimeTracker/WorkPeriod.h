//
//  WorkPeriod.h
//  TimeTracker
//
//  Created by Taylor Mott on 19 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface WorkPeriod : NSManagedObject

@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * memo;
@property (nonatomic, retain) Project *project;

@end
