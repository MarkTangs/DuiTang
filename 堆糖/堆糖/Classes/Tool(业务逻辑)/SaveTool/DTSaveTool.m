//
//  DTSaveTool.m
//  堆糖
//
//  Created by ZYZ on 16/2/24.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTSaveTool.h"

@implementation DTSaveTool
+ (nullable id)objectForKey:(NSString *)defaultName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName{
    
    if (defaultName) {
        // 屏蔽一下外界的sb行为
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
