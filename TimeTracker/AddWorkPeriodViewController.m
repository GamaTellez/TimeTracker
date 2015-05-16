//
//  AddWorkPeriodViewController.m
//  TimeTracker
//
//  Created by Taylor Mott on 16 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "AddWorkPeriodViewController.h"
#import "WorkPeriod.h"

@interface AddWorkPeriodViewController ()

@property (strong, nonatomic) UIDatePicker *startDatePicker;
@property (strong, nonatomic) UIDatePicker *endDatePicker;

@end

@implementation AddWorkPeriodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Navigation bar
    self.title = @"Add Work Period";
    
    UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonPressed)];
    self.navigationItem.leftBarButtonItem = cancelBarButton;
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed)];
    self.navigationItem.rightBarButtonItem = doneBarButton;
    
    
    //Start date header (Green)
    UILabel *startDateLabel = [UILabel new];
    [startDateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    startDateLabel.text = @"  Select Clock-In Time";
    startDateLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:startDateLabel];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:startDateLabel
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:64.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:startDateLabel
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:startDateLabel
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    
    //Start date picker
    self.startDatePicker = [UIDatePicker new];
    [self.startDatePicker setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.startDatePicker];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.startDatePicker
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:startDateLabel
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    
    //End date header (red)
    UILabel *endDateLabel = [UILabel new];
    [endDateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    endDateLabel.text = @"  Select Clock-Out Time";
    endDateLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:endDateLabel];
    
    constraint = [NSLayoutConstraint constraintWithItem:endDateLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.startDatePicker
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:endDateLabel
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:endDateLabel
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
    
    //End date picker
    self.endDatePicker = [UIDatePicker new];
    [self.endDatePicker setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.endDatePicker];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.endDatePicker
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:endDateLabel
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                               constant:0.0];
    [self.view addConstraint:constraint];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Bar Button Methods

- (void)cancelButtonPressed
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneButtonPressed
{
    UIAlertController *addMemoAlert = [UIAlertController alertControllerWithTitle:@"Add memo?" message:@"Enter a memo for your work period." preferredStyle:UIAlertControllerStyleAlert];
    
    [addMemoAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Memo";
    }];
    
    [addMemoAlert addAction:[UIAlertAction actionWithTitle:@"Edit Time" style:UIAlertActionStyleCancel handler:nil]];
    
    [addMemoAlert addAction:[UIAlertAction actionWithTitle:@"Add Work Period" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        WorkPeriod *workPeriod = [WorkPeriod new];
        workPeriod.startDate = self.startDatePicker.date;
        workPeriod.endDate = self.endDatePicker.date;
        workPeriod.memo = ((UITextField *)addMemoAlert.textFields[0]).text;
        
        [self.project addWorkPeriod:workPeriod];
        
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self.navigationController presentViewController:addMemoAlert animated:YES completion:nil];
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
