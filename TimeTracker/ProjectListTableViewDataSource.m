//
//  ProjectListTableViewDataSource.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectListTableViewDataSource.h"
#import "ProjectController.h"
#import "Project.h"

static NSString *cellID = @"cellID";

@implementation ProjectListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[ProjectController sharedInstance].projectsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    Project *project = [ProjectController sharedInstance].projectsArray[indexPath.row];
    
    cell.textLabel.text = project.title;
    
    cell.detailTextLabel.text = [project totalProjectTimeString];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Project *project = [ProjectController sharedInstance].projectsArray[indexPath.row];
        [[ProjectController sharedInstance] deleteProject:project];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
                
@end