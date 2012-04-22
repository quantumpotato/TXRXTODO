//
//  TXTaskCreatorProtocol.h
//  TXTODO
//
//  Created by Anthony Broussard on 4/21/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TXTaskCreatorProtocol <NSObject>

- (void)taskCreated:(NSString *)task;
- (void)taskUpdated:(NSString *)oldTask newTask:(NSString *)task;

@end