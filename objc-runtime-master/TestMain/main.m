//
//  main.m
//  TestMain
//
//  Created by lei on 16/4/27.
//
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AppDelegate *app = [[AppDelegate alloc] init];
        [app hello];
        [app hello];
    }
    
    return 0;
//    return NSApplicationMain(argc, argv);
}

