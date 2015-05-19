//
//  Project+Helper.h
//  TimeTracker
//
//  Created by Taylor Mott on 19 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "Project.h"

static NSString *projectClassString = @"Project";

@interface Project (Helper)

- (NSString *)totalProjectTimeString;

@end
