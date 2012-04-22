//
//  FirstViewController.h
//  TXTODO
//
//  Created by Anthony Broussard on 4/17/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXNewTaskViewController.h"

@interface FirstViewController : UIViewController <UITableViewDataSource, 
UITableViewDelegate,
TXTaskCreatorProtocol>

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *tasks;

@end
