//
//  AppDelegate+append.m
//  objc
//
//  Created by lei on 16/4/28.
//
//

#import "AppDelegate+append.h"
#import "runtime.h"
#import "message.h"

static NSString *const myName = @"myname";

@implementation AppDelegate (append)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, &myName, name, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, &myName);
}

@end
