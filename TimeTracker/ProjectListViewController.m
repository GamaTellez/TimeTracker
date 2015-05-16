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
#import "Project.h"
#import "ProjectDetailViewController.h"

@interface ProjectListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ProjectListTableViewDataSource *dataSource;

@end

@implementation ProjectListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Projects";
    
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed)];
    self.navigationItem.rightBarButtonItem = addBarButton;
    
    self.dataSource = [ProjectListTableViewDataSource new];
    
    self.tableView = [UITableView new];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeLeft
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeLeft
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeRight
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeBottom
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                             attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:constraint];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Bar Methods

- (void)addButtonPressed
{
    UIAlertController *addProjectAlert = [UIAlertController alertControllerWithTitle:@"Add new project?" message:@"Enter a title for your project." preferredStyle:UIAlertControllerStyleAlert];
    
    [addProjectAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Project Title";
    }];
    
    [addProjectAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [addProjectAlert addAction:[UIAlertAction actionWithTitle:@"Add Project" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSString *projectTitle = ((UITextField *)addProjectAlert.textFields[0]).text;
        
        Project *project = [Project new];
        project.title = projectTitle;
        
        [[ProjectController sharedInstance] addProject:project];
        
        [self.tableView reloadData];
    }]];
    
    [self.navigationController presentViewController:addProjectAlert animated:YES completion:nil];
}

#pragma mark - UITableView Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Project *project = [ProjectController sharedInstance].projectsArray[indexPath.row];
    
    ProjectDetailViewController *detailViewController = [ProjectDetailViewController new];
    detailViewController.project = project;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end






