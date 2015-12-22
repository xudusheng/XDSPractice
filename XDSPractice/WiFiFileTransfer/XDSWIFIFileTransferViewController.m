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
@property (weak, nonatomic) IBOutlet UILabel *IPAndPortLabel;
@property (weak, nonatomic) IBOutlet UILabel *uploadProgressLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *uploadProgressView;

@property (assign, nonatomic)NSInteger fileCount;//文件数量  许杜生添加 2015.12.22
@property (assign, nonatomic)UInt64 contentLength;//文件内容大小  许杜生添加 2015.12.22
@property (assign, nonatomic)UInt64 downloadLength;//已下载的文件内容大小  许杜生添加 2015.12.22

//self.fileCount += 1;
//self.contentLength = contentLength;
//self.downloadLength = 0;
@end

@implementation XDSWIFIFileTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self XDSWIFIFileTransferViewControllerDataInit];
    [self createXDSWIFIFileTransferViewControllerUI];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveANewFileNotification:) name:kGetContentLengthNotificationName object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveDownloadProcessBodyDataNotification:) name:kDownloadProcessBodyDataNotificationName object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([httpServer isRunning]) {
        [httpServer stop];
    }
}


- (void)receiveANewFileNotification:(NSNotification *)notification{
    NSLog(@"class = %@", notification.class);
    self.fileCount += 1;
    self.contentLength = [notification.object longLongValue];
    self.downloadLength = 0;
}

- (void)receiveDownloadProcessBodyDataNotification:(NSNotification *)notification{
    self.downloadLength += [notification.object length];
    // 主线程执行
    dispatch_async(dispatch_get_main_queue(), ^{
        // something
        _uploadProgressView.progress = (double)_downloadLength/_contentLength;
        _uploadProgressLabel.text = [NSString stringWithFormat:@"正在上传第%zd个文件，进度%zd%%\n你可在“导入图书”文件夹中找到它们。", _fileCount, (NSInteger)(_uploadProgressView.progress * 100)];
    });
}
#pragma mark - UI相关
- (void)createXDSWIFIFileTransferViewControllerUI{
    _uploadProgressView.progress = 0.0;
    httpServer = [[HTTPServer alloc] init];
    [httpServer setType:@"_http._tcp."];
    // webPath是server搜寻HTML等文件的路径
    NSString *webPath = [[NSBundle mainBundle] resourcePath];
    [httpServer setDocumentRoot:webPath];
    [httpServer setConnectionClass:[MyHTTPConnection class]];
    NSLog(@"connectionClass = %@", [httpServer connectionClass]);
    
    NSError *err;
    if ([httpServer start:&err]) {
        NSLog(@"IP %@",[XDSIPHelper deviceIPAdress]);
        NSLog(@"port %hu",[httpServer listeningPort]);
        _IPAndPortLabel.text = [NSString stringWithFormat:@"http://%@:%hu", [XDSIPHelper deviceIPAdress], [httpServer listeningPort]];
    }else{
        NSLog(@"%@",err);
    }

}

#pragma mark - 代理方法

#pragma mark - 网络请求

#pragma mark - 点击事件处理

#pragma mark - 其他私有方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"keyPath = %@", keyPath);
    NSLog(@"object = %@", object);
    NSLog(@"change = %@", change);
}
#pragma mark - 内存管理相关
- (void)XDSWIFIFileTransferViewControllerDataInit{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
