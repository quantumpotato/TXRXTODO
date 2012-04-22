//
//  FirstViewController.m
//  TXTODO
//
//  Created by Anthony Broussard on 4/17/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import "FirstViewController.h"
#import "TXFileHelpers.h"
#import "TXTaskDetailViewController.h"

#define TX_DEFAULT_TASK_COUNT 30

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize tableView = _tableView;
@synthesize tasks = _tasks;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (NSString *)taskFilePath {
    return [TXFileHelpers documentsPathWithPath:@"tasks.plist"];
}

- (NSMutableArray *)loadTasks {
    NSMutableArray *tasks;
    NSString *filePath = [self taskFilePath];
    BOOL dataExists = [TXFileHelpers fileExistsAtPath:filePath];
    if (dataExists) {
        tasks = [NSMutableArray arrayWithContentsOfFile:filePath];
    } else {
        tasks = [NSMutableArray array];
    }
    
    return tasks;
}

- (void)newButtonPressed {
    TXNewTaskViewController *vc = [[TXNewTaskViewController alloc] initWithNibName:@"TXNewTaskViewController" 
                                                                             bundle:nil];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [self loadTasks];
    
    UIBarButtonItem *button = [[[UIBarButtonItem alloc] initWithTitle:@"New"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                               action:@selector(newButtonPressed)] autorelease];
    self.navigationItem.rightBarButtonItem = button;
}


- (void)viewDidUnload {
    [super viewDidUnload];
    self.tasks = nil;
}

- (void)saveTasksToFile {
    [self.tasks writeToFile:[self taskFilePath] atomically:YES];
}

#pragma New Task Creator Delegate

- (void)taskCreated:(NSString *)task {
    NSLog(@"task created: %@", task);
    [self.tasks addObject:task];
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
    [self saveTasksToFile];
}

- (void)taskUpdated:(NSString *)oldTask newTask:(NSString *)task {

    for (NSInteger i = 0; i < self.tasks.count; i++) {
        NSString *existingTask = [self.tasks objectAtIndex:i];
        if ([existingTask isEqualToString:oldTask]) {
            [self.tasks removeObjectAtIndex:i];
            [self.tasks insertObject:task atIndex:i];
            break;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    [self saveTasksToFile];
    [self.tableView reloadData];
}

#pragma mark UITableView

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *task = [self.tasks objectAtIndex:indexPath.row];
    [self.tasks removeObject:task];
    [self.tableView reloadData];
    [self saveTasksToFile];    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *todoCellIdentifier = @"TXTODOCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:todoCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:todoCellIdentifier];
    }

    cell.textLabel.text = [self.tasks objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *task = [self.tasks objectAtIndex:indexPath.row];
    TXTaskDetailViewController *vc = [[[TXTaskDetailViewController alloc] initWithTask:task] autorelease];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dealloc {
    self.tableView = nil;
    self.tasks = nil;
    [super dealloc];
}

@end
