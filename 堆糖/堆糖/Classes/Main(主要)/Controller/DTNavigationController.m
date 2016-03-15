//
//  DTNavigationController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTNavigationController.h"
#import "UIBarButtonItem+DT.h"

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
        
       
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
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

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    BOOL open = self.viewControllers.count > 1;
    
    return open;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    

    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithNorImage:[UIImage imageNamed:@"icon_back_light"] andHighlightImage:[UIImage imageNamed:@"icon_back_light"] Target:self action:@selector(back) Title:nil];
    }
    [super pushViewController:viewController animated:animated];
    
    
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}
@end
