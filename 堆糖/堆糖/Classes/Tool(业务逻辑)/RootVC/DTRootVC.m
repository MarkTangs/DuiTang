//
//  DTRootVC.m
//  堆糖
//
//  Created by ZYZ on 16/2/24.
//  Copyright © 2016年 ZYZ. All rights reserved.
//
#define DTVersion @"version"
#import "DTRootVC.h"
#import "DTTabBarController.h"
#import "DTNewFeatureViewController.h"
#import "DTSaveTool.h"

@implementation DTRootVC
+ (UIViewController *)chooseWindowVC
{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString *lastVersion = [DTSaveTool objectForKey:DTVersion];
    
    UIViewController *rootVC;
    if (![currentVersion isEqualToString:lastVersion]) {
        rootVC = [[DTNewFeatureViewController alloc]init];
        [DTSaveTool setObject:currentVersion forKey:DTVersion];
    }else
    {
        rootVC = [[DTTabBarController alloc]init];
        
    }
    return rootVC;
}
@end
