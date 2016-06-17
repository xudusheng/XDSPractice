//
//  XDSWebViewBridgeController.m
//  XDSPractice
//
//  Created by zhengda on 16/6/1.
//  Copyright © 2016年 zhengda. All rights reserved.
//

#import "XDSWebViewBridgeController.h"
#import <WebKit/WebKit.h>
#import "WebViewJavascriptBridge.h"

@interface XDSWebViewBridgeController ()<UIWebViewDelegate>

@property WebViewJavascriptBridge *bridge;
@property (strong, nonatomic)UIWebView * webView;

@end

@implementation XDSWebViewBridgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSString * url = @"http://172.16.72.47:9080/lottery-web/commonAction?resultPage=front/childrenDay&typeNo=1017&sessionToken=blhUN0UvZ0tBbHFYKzh0WkJldXVMQ3lqbi9iU1JodmU";
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    
    [WebViewJavascriptBridge enableLogging];
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
    [_bridge setWebViewDelegate:self];
    
}

@end
