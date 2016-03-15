//
//  DTSettingGroup.m
//  堆糖
//
//  Created by ZYZ on 16/3/16.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTSettingGroup.h"

@implementation DTSettingGroup

+(instancetype)groupsWithItems:(NSArray *)items
{
    DTSettingGroup *groups = [[DTSettingGroup alloc]init];
    groups.items = items;
    
    return groups;
}


@end
