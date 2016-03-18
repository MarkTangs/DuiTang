//
//  UIBarButtonItem+DT.m
//  堆糖
//
//  Created by ZYZ on 16/3/16.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "UIBarButtonItem+DT.h"

@implementation UIBarButtonItem (DT)
#pragma mark - push时候设置按钮
+(UIBarButtonItem *)barButtonItemWithNorImage:(UIImage *)Norimage andHighlightImage:(UIImage *)Higimage Target:(id)target action:(SEL)action Title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    
    
    [btn setImage:Norimage forState:UIControlStateNormal];
    [btn setImage:Higimage forState:UIControlStateHighlighted];
    [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [btn sizeToFit];
    UIView *contenView = [[UIView alloc]initWithFrame:btn.bounds];
    [contenView addSubview:btn];
    
    [btn addTarget:target action:action  forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:contenView];
}


@end
