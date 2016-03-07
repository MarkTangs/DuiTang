//
//  DTNavigationController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTNavigationController.h"

@interface DTNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
/** 系统手势代理 */
@property (nonatomic, strong) id popGesture;
@end

@implementation DTNavigationController
+ (void)initialize{

    if (self == [DTNavigationController class]) {

        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self,nil];

        // 设置字体颜色大小
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        
        //字体大小
        dictM[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        // 字体颜色
        dictM[NSForegroundColorAttributeName] = [UIColor blackColor];
        
        [bar setTitleTextAttributes:dictM];
        
        
        // 设置导航条前景色
        [bar setTintColor:[UIColor whiteColor]];
        
        //    bar
        // 获取到导航条按钮的标识
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
//        [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        // 修改返回按钮标题的位置
        [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    // 1.先修改系统的手势,系统没有给我们提供属性
    //    NSLog(@"%@",self.interactivePopGestureRecognizer);
//    UIScreenEdgePanGestureRecognizer *gest = self.interactivePopGestureRecognizer;
    
    id target = self.interactivePopGestureRecognizer.delegate;
    //
    //    // 2.自己添加手势
    //    // 禁止系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    //    pan.enabled = NO;
    
    [self.view addGestureRecognizer:pan];
    
    pan.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate
// 当开始滑动的就会调用 如果返回YES ,可以滑动 返回NO,禁止手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    // 当是跟控制器不让移除(禁止), 费根控制器,允许移除控制
    //    NSLog(@"%ld",self.viewControllers.count);
    BOOL open = self.viewControllers.count > 1;
    
    return open;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 当非根控制器隐藏底部tabbar
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //    NSLog(@"%ld",self.viewControllers.count);
    
    // 执行这一行代码将控制器压栈
    [super pushViewController:viewController animated:animated];
    
    
}

@end
