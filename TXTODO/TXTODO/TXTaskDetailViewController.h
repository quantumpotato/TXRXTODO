//
//  TXTaskDetailViewControllerViewController.h
//  TXTODO
//
//  Created by Anthony Broussard on 4/21/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXTaskCreatorProtocol.h"

@interface TXTaskDetailViewController : UIViewController {
    NSString *_task;
}

@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, assign) id <TXTaskCreatorProtocol> delegate;

- (id)initWithTask:(NSString *)task;

@end
