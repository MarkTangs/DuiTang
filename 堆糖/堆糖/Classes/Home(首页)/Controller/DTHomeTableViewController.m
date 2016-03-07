//
//  DTHomeTableViewController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTHomeTableViewController.h"
#import "UIImage+DT.h"
#import "DTIaaViewController.h"

@interface DTHomeTableViewController ()

@end

@implementation DTHomeTableViewController
- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithRenderOriginalName:@"nav_icon_add_red"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnOnClick)];
    
}
- (void)leftBtnOnClick
{
    DTIaaViewController *vc = [[DTIaaViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
