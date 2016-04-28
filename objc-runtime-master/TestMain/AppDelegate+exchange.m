//
//  AppDelegate+exchange.m
//  objc
//
//  Created by lei on 16/4/28.
//
//

#import "AppDelegate+exchange.h"
#import <objc/message.h>

@implementation AppDelegate (exchange)

+ (void)load {
    Method helloMethod = class_getClassMethod(self, @selector(hello));
    Method change_helloMethod = class_getClassMethod(self, @selector(change_hello));
    
    method_exchangeImplementations(helloMethod, change_helloMethod);
}

+ (void)change_hello {
    printf("change_hello");
}

@end
