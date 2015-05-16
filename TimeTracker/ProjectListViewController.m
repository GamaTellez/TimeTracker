//
//  ViewController.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectListViewController.h"
#import "ProjectListTableViewDataSource.h"
#import "ProjectController.h"

@interface ProjectListViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ProjectListTableViewDataSource *dataSource;

@end

@implementation ProjectListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [ProjectListTableViewDataSource new];
    
    self.tableView = [UITableView new];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.dataSource = self.dataSource;
    
    [self.view addSubview:self.tableView];
    
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeLeft
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeLeft
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeRight
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeBottom
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:contraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end