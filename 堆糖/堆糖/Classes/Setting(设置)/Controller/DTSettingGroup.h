//
//  DTSettingGroup.h
//  堆糖
//
//  Created by ZYZ on 16/3/16.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTSettingGroup : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footTitle;

@property (nonatomic, strong) NSArray *items;

+(instancetype)groupsWithItems:(NSArray *)items;
@end
