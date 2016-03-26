//
//  ContentItem.h
//  堆糖
//
//  Created by ZYZ on 16/3/21.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContenItems.h"

//@class ContenItems;

@interface ContentGroupItem : NSObject


@property(nonatomic,strong)NSString *group_name;

@property(nonatomic,strong)NSArray<ContenItems *> *group_items;

@end
