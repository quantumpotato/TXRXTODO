//
//  TXTaskDetailViewControllerViewController.m
//  TXTODO
//
//  Created by Anthony Broussard on 4/21/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import "TXTaskDetailViewController.h"

@interface TXTaskDetailViewController ()

@end

@implementation TXTaskDetailViewController
@synthesize textView;
@synthesize delegate;

- (id)initWithTask:(NSString *)task {
    self = [super init];
    if (self) {
        _task = [task copy];
    }
    return self;
}

- (void)saveButtonTapped {
    NSString *task = self.textView.text;
    [self.delegate taskUpdated:_task newTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView = [[[UITextView alloc] initWithFrame:CGRectMake(0,0,320,400)] autorelease];
    self.textView.text = _task;
    [self.view addSubview:self.textView];
    
    UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                    style:UIBarButtonItemStylePlain 
                                                                   target:self 
                                                                   action:@selector(saveButtonTapped)] autorelease];
    self.navigationItem.rightBarButtonItem = saveButton;

}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.textView = nil;
}

- (void)dealloc {
    [_task release];
    self.textView = nil;
    self.delegate = nil;
    [super dealloc];
}
@end
