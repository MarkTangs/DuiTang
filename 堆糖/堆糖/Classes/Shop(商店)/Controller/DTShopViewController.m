//
//  DTShopTableViewController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTShopViewController.h"
#import "UIBarButtonItem+DT.h"
#import <WebKit/WebKit.h>

@interface DTShopViewController()<UIWebViewDelegate>

@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)UIButton *leftButton;

@end


@implementation DTShopViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpNavButton];
    
    WKWebView *web = [[WKWebView alloc]init];
   
    _webView = web;
    [self.view addSubview:web];
    [self loadData];
 }
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _webView.frame = self.view.bounds;
    NSLog(@"%@",NSStringFromCGRect(self.webView.frame));
}
/**
 *  加载网页
 */
- (void)loadData
{
    NSURL *baseUrl = [NSURL URLWithString:@"http://buy.duitang.com/buy/#/entry?from=app&_urlopentype=page&app_version=5.9&app_code=gandalf&__urlopentype=pageweb&_k=h6lmof"];

    NSURLRequest *request = [NSURLRequest requestWithURL:baseUrl];
    [self.webView loadRequest:request];
    
    [_webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [_webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    
    
}
- (void)setUpNavButton
{
    
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton = leftBtn;
        
        [leftBtn setImage:[UIImage imageNamed:@"icon_back_dark"] forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"icon_back_dark"] forState:UIControlStateHighlighted];
        [leftBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [leftBtn sizeToFit];
        
        UIView *contenView = [[UIView alloc]initWithFrame:leftBtn.bounds];
        [contenView addSubview:leftBtn];
        
        [leftBtn addTarget:self action:@selector(back)  forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:contenView];
}
#pragma mark - 返回
- (void)back
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    self.leftButton.hidden = !self.webView.canGoBack;
}

#pragma mark - 对象被销毁
- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
