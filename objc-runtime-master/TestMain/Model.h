//
//  Model.h
//  objc
//
//  Created by lei on 16/4/28.
//
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, readwrite, strong) NSString *name;
@property (nonatomic, readonly, assign) NSUInteger age;

@end
