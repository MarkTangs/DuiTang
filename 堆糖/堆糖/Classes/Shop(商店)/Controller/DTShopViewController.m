//
//  DTShopTableViewController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTShopViewController.h"
#import "UIBarButtonItem+DT.h"
#import "SVWebViewController.h"
@interface DTShopViewController()<UIWebViewDelegate>


@property(nonatomic,strong)UIButton *leftButton;

@end


@implementation DTShopViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *URL = [NSURL URLWithString:@"http://buy.duitang.com/buy/#/entry?from=app&_urlopentype=page&app_version=5.9&app_code=gandalf&__urlopentype=pageweb&_k=h6lmof"];
    SVWebViewController *webViewController = [[SVWebViewController alloc] initWithURL:URL];
    [self.navigationController pushViewController:webViewController animated:YES];
    

   
   
    [self loadData];
 }


/**
 *  加载网页
 */
- (void)loadData
{
//    NSURL *baseUrl = [NSURL URLWithString:@"http://buy.duitang.com/buy/#/entry?from=app&_urlopentype=page&app_version=5.9&app_code=gandalf&__urlopentype=pageweb&_k=h6lmof"];

    
   
    
    
}

#pragma mark - 返回


#pragma mark - 对象被销毁


@end
