//
//  Model+Archive.h
//  objc
//
//  Created by lei on 16/4/28.
//
//

#import "Model.h"

@interface Model (Archive)

+ (instancetype)modelWithDict:(NSDictionary *)dict updateDict:(NSDictionary *)updateDict;

@end
