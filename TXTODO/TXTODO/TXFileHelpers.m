//
//  TXFileHelpers.m
//  TXTODO
//
//  Created by Anthony Broussard on 4/21/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import "TXFileHelpers.h"

@implementation TXFileHelpers


+ (BOOL)fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)documentsPathWithPath:(NSString *)path {	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:path];
}

+ (BOOL)fileExistsNamed:(NSString *)fileName {
    fileName = [self documentsPathWithPath:fileName];
    return [self fileExistsAtPath:fileName];
}


@end
