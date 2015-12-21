//
//  XDSWIFIFileTransferViewController.m
//  XDSPractice
//
//  Created by zhengda on 15/12/21.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "XDSWIFIFileTransferViewController.h"
#import "HTTPServer.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "MyHTTPConnection.h"
#import "XDSIPHelper.h"
@interface XDSWIFIFileTransferViewController (){
    HTTPServer *httpServer;
}

@end

@implementation XDSWIFIFileTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self XDSWIFIFileTransferViewControllerDataInit];
    [self createXDSWIFIFileTransferViewControllerUI];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([httpServer isRunning]) {
        [httpServer stop];
    }
}
#pragma mark - UI相关
- (void)createXDSWIFIFileTransferViewControllerUI{
    httpServer = [[HTTPServer alloc] init];
    [httpServer setType:@"_http._tcp."];
    // webPath是server搜寻HTML等文件的路径
    NSString *webPath = [[NSBundle mainBundle] resourcePath];
    [httpServer setDocumentRoot:webPath];
    [httpServer setConnectionClass:[MyHTTPConnection class]];
    NSError *err;
    if ([httpServer start:&err]) {
        NSLog(@"IP %@",[XDSIPHelper deviceIPAdress]);
        NSLog(@"port %hu",[httpServer listeningPort]);
    }else{
        NSLog(@"%@",err);
    }
}

#pragma mark - 代理方法

#pragma mark - 网络请求

#pragma mark - 点击事件处理

#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)XDSWIFIFileTransferViewControllerDataInit{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
