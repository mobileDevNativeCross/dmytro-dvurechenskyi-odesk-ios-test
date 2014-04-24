//
//  SomeClass.m
//  BuggyProject
//  Copyright (c) 2014 oDesk Corporation. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

+ (void)printTextInMain:(NSString *)someText {
    
	/*dispatch_sync(dispatch_get_main_queue(), ^{
     NSLog(@"%@", someText);
     });
     */
/*    we can do something like this
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@", someText);
    });
 */
//And i think wright answer is
    dispatch_block_t block = ^
    {
        NSLog(@"%@", someText);
    };
    
    if ([NSThread isMainThread])
    {
        block();
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

@end
