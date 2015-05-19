//
//  ProjectDetailViewController.m
//  TimeTracker
//
//  Created by Taylor Mott on 15 May 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "AddWorkPeriodViewController.h"
#import "WorkPeriodTableViewDataSource.h"
#import <MessageUI/MessageUI.h>
#import "ProjectController.h"

@interface ProjectDetailViewController () <UITextFieldDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) WorkPeriodTableViewDataSource *dataSource;
@property (strong, nonatomic) NSDate *clockInDate;

@end

@implementation ProjectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //Toolbar
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
    
    
    
    //TextField
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
    
    
    
    //TableView and DataSource
    self.dataSource = [WorkPeriodTableViewDataSource new];
    self.dataSource.project = self.project;
    
    self.tableView = [UITableView new];
    self.tableView.dataSource = self.dataSource;
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
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

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Toolbar methods

- (void)addButtonPressed
{
    AddWorkPeriodViewController *addWorkPeriodViewController = [AddWorkPeriodViewController new];
    addWorkPeriodViewController.project = self.project;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:addWorkPeriodViewController];

    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
}

- (void)clockInButtonPressed
{
    if (self.clockInDate) {
        UIAlertController *alreadyClockedInAlert = [UIAlertController alertControllerWithTitle:@"Already Clocked In" message:@"You are already clocked in. Clock out first." preferredStyle:UIAlertControllerStyleAlert];
        
        [alreadyClockedInAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        [self.navigationController presentViewController:alreadyClockedInAlert animated:YES completion:nil];
    }
    else
    {
        self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
        self.title = @"Clocked In";
        self.clockInDate = [NSDate date];
    }
    
}

- (void)clockOutButtonPressed
{
    if (!self.clockInDate) {
        UIAlertController *notClockedInAlert = [UIAlertController alertControllerWithTitle:@"Not Clocked In" message:@"You are not clocked in. Either clock in or consider adding a work period with clock in and out times." preferredStyle:UIAlertControllerStyleAlert];
        
        [notClockedInAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        [self.navigationController presentViewController:notClockedInAlert animated:YES completion:nil];
    }
    else
    {
        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
        self.title = @"Clocked Out";
        
        WorkPeriod *workPeriod = [[ProjectController sharedInstance] createWorkPeriodInProject:self.project];
        
        workPeriod.startDate = self.clockInDate;
        workPeriod.endDate = [NSDate date];
        
        UIAlertController *addMemoAlert = [UIAlertController alertControllerWithTitle:@"Add memo?" message:@"Enter a memo for your work period." preferredStyle:UIAlertControllerStyleAlert];
        
        [addMemoAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"Memo";
        }];
        
        [addMemoAlert addAction:[UIAlertAction actionWithTitle:@"No Memo" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            workPeriod.memo = @"";
            
            [[ProjectController sharedInstance] save];
            
            self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
            self.title = @"";
            [self.tableView reloadData];
        }]];
        
        [addMemoAlert addAction:[UIAlertAction actionWithTitle:@"Add Work Period" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            workPeriod.memo = ((UITextField *)addMemoAlert.textFields[0]).text;
            
            [[ProjectController sharedInstance] save];
            
            self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
            self.title = @"";
            [self.tableView reloadData];
        }]];
        
        [self.navigationController presentViewController:addMemoAlert animated:YES completion:nil];
        
        self.clockInDate = nil;
    }
    
}

- (void)reportButtonPressed
{
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertController *cantSentMailAlert = [UIAlertController alertControllerWithTitle:@"Can't Send Mail" message:@"You may need to setup Mail account in Settings." preferredStyle:UIAlertControllerStyleAlert];
        
        [cantSentMailAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        [self.navigationController presentViewController:cantSentMailAlert animated:YES completion:nil];
    }
    else
    {
        NSString *messageBodyString = @"";
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        
        for (WorkPeriod *workPeriod in self.project.workPeriods)
        {
            NSString *startDateString = [dateFormatter stringFromDate:workPeriod.startDate];
            NSString *endDateString = [dateFormatter stringFromDate:workPeriod.endDate];
            
            NSString *dateString = [NSString stringWithFormat:@"%@ to %@", startDateString, endDateString];
            NSString *memoString = [NSString stringWithFormat:@" -- %@<br>", workPeriod.memo];
            
            messageBodyString = [messageBodyString stringByAppendingString:[dateString stringByAppendingString:memoString]];
        }
        
        NSString *totalTimeString = [NSString stringWithFormat:@"<br>Total Time: %@", [self.project totalProjectTimeString]];
        
        [messageBodyString stringByAppendingString:totalTimeString];
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        
        
        [mailViewController setSubject:[NSString stringWithFormat:@"Hours for %@", self.project.title]];
        [mailViewController setMessageBody:messageBodyString isHTML:YES];
        
        [self.navigationController presentViewController:mailViewController animated:YES completion:nil];
    }
}

#pragma mark - MFMailComposeViewController Delegate Methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
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
