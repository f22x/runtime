//
//  Model+Archive.m
//  objc
//
//  Created by lei on 16/4/28.
//
//

#import "Model+Archive.h"
#import "runtime.h"

@implementation Model (Archive)

+ (instancetype)modelWithDict:(NSDictionary *)dict updateDict:(NSDictionary *)updateDict {
    id model = [[self alloc] init];
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        ivarName = [ivarName substringFromIndex:1];
        NSLog(@"%@", ivarName);
        free(ivars);
    }
    return model;
}

@end
