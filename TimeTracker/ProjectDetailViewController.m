//
//  ProjectDetailViewController.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectDetailViewController.h"

@interface ProjectDetailViewController ()

@end

@implementation ProjectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.project.title;
    self.view.backgroundColor = [UIColor purpleColor];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Toolbar methods

- (void)addButtonPressed
{
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
