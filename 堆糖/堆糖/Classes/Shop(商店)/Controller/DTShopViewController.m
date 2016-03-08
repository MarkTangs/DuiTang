//
//  DTShopTableViewController.m
//  堆糖
//
//  Created by ZYZ on 16/2/25.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import "DTShopViewController.h"

@interface DTShopViewController()<UIWebViewDelegate>


@property(nonatomic,strong)UIWebView *webView;


@end


@implementation DTShopViewController
- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
    }
    return _webView;
}
- (void)loadView
{
    self.view = self.webView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://buy.duitang.com/buy/#/entry?from=app&_urlopentype=page&app_version=5.9&app_code=gandalf&__urlopentype=pageweb&_k=h6lmof"]];
    [self.webView loadRequest:request];
//    [self.view addSubview:self.webView];
    self.webView.delegate = self;

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError");
}


@end
