//
//  DTDiscoverCollectionViewCell.m
//  堆糖
//
//  Created by ZYZ on 16/3/21.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTDiscoverCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "ContenItems.h"
#import <MJExtension.h>
@interface DTDiscoverCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lavelView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation DTDiscoverCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setItem:(ContenItems *)item
{
    _item = item;
//    _item = [ContenItems mj_objectWithKeyValues:item];
    
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_item.icon_url]];
    _lavelView.text = _item.name;
}
@end
