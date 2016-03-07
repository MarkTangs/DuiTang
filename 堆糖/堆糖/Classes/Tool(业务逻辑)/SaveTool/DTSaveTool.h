//
//  DTSaveTool.h
//  堆糖
//
//  Created by ZYZ on 16/2/24.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTSaveTool : NSObject
+ (nullable id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;
@end
