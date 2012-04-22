//
//  TXFileHelpers.h
//  TXTODO
//
//  Created by Anthony Broussard on 4/21/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXFileHelpers : NSObject

+ (BOOL)fileExistsNamed:(NSString *)fileName;
+ (NSString *)documentsPathWithPath:(NSString *)path;
+ (BOOL)fileExistsAtPath:(NSString *)path;

@end
