//
//  TXNewTaskViewController.h
//  TXTODO
//
//  Created by Anthony Broussard on 4/21/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXTaskCreatorProtocol.h"

@interface TXNewTaskViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *entryField;
@property (nonatomic, assign) id <TXTaskCreatorProtocol> delegate;

@end
