//
//  ProjectDetailViewController.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "AddWorkPeriodViewController.h"

@interface ProjectDetailViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ProjectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed)];
    
    UIBarButtonItem *flexSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *clockInBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Clock In" style:UIBarButtonItemStylePlain target:self action:@selector(clockInButtonPressed)];
    
    UIBarButtonItem *flexSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *clockOutBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Clock Out" style:UIBarButtonItemStylePlain target:self action:@selector(clockOutButtonPressed)];
    
    UIBarButtonItem *flexSpace3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *reportBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(reportButtonPressed)];
    
    UIToolbar *toolbar = [UIToolbar new];
    [toolbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    toolbar.items = @[addBarButton, flexSpace1, clockInBarButton, flexSpace2, clockOutBarButton, flexSpace3, reportBarButton];
    
    [self.view addSubview:toolbar];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:toolbar
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:toolbar
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:toolbar
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    UITextField *textField = [UITextField new];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    textField.text = self.project.title;
    textField.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    textField.delegate = self;
    [self.view addSubview:textField];
    
    
    constraint = [NSLayoutConstraint constraintWithItem:textField
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1.0
                                               constant:64.0 + 8.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:textField
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1.0
                                               constant:8.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:textField
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1.0
                                               constant:-8.0];
    [self.view addConstraint:constraint];
    
    self.tableView = [UITableView new];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.tableView];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:textField
                                             attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                              constant:8.0];
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
                                                toItem:toolbar
                                             attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                              constant:0.0];
    [self.view addConstraint:constraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Toolbar methods

- (void)addButtonPressed
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[AddWorkPeriodViewController new]];
    
    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
}

- (void)clockInButtonPressed
{
    
}

- (void)clockOutButtonPressed
{
    
}

- (void)reportButtonPressed
{
    
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.project.title = textField.text;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
