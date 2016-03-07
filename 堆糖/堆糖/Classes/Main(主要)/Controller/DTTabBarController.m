//
//  DTTabBarController.m
//  堆糖
//
//  Created by ZYZ on 16/2/24.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTTabBarController.h"
#import "DTNavigationController.h"

#import "DTHomeTableViewController.h"
#import "DTDiscoverTableViewController.h"
#import "DTShopTableViewController.h"
#import "DTMySettingTableViewController.h"

#import "UIImage+DT.h"
#import "UIColor+DT.h"
@interface DTTabBarController ()



@end


@implementation DTTabBarController

- (void)viewDidLoad
{
    //添加子控制器
    [self setupAllChildViewController];
  
}

- (void)setupAllChildViewController
{
    /** 首页*/
    DTHomeTableViewController *home = [[DTHomeTableViewController alloc] init];
    [self setupOneChildViewController:home image:[UIImage imageWithRenderOriginalName:@"tab_icon_home"] selImage:[UIImage imageWithRenderOriginalName:@"tab_icon_home_highlight"] title:@"每日精选"buttonTitle:@"首页"];
    
    /** 发现*/
    DTDiscoverTableViewController *discover = [[DTDiscoverTableViewController alloc] init];
    [self setupOneChildViewController:discover image:[UIImage imageWithRenderOriginalName:@"tab_icon_explore"] selImage:[UIImage imageWithRenderOriginalName:@"tab_icon_explore_highlight"] title:@"发现"buttonTitle:@"发现"];
    
    /** 商店*/
    DTShopTableViewController *shop = [[DTShopTableViewController alloc] init];
    [self setupOneChildViewController:shop image:[UIImage imageWithRenderOriginalName:@"tab_icon_store"] selImage:[UIImage imageWithRenderOriginalName:@"tab_icon_store_highlight"] title:@""buttonTitle:@"商店"];
    
    /** 我*/
    DTMySettingTableViewController *mySetting = [[DTMySettingTableViewController alloc] init];
    [self setupOneChildViewController:mySetting image:[UIImage imageWithRenderOriginalName:@"tab_icon_me"] selImage:[UIImage imageWithRenderOriginalName:@"tab_icon_me_highlight"] title:@"" buttonTitle:@"我"] ;
    
    
}
// 添加一个子控制器
- (void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title buttonTitle:(NSString *)buttonTitle{
    


    UINavigationController *nav = [[DTNavigationController alloc] initWithRootViewController:vc];
    

    
    [self addChildViewController:nav];
    

    vc.navigationItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    vc.tabBarItem.title = buttonTitle;

    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor DTMenuSeletColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor DTMenuNormalColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
   
}

@end
