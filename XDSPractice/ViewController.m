//
//  ViewController.m
//  XDSPractice
//
//  Created by zhengda on 8/5/15.
//  Copyright (c) 2015 zhengda. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (strong, nonatomic)NSUserDefaults * groupDefauls;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationWillResignActive)
                                                name:UIApplicationWillResignActiveNotification
                                              object:nil];
    
//    这里注意，可能一般我们在使用 NSUserDefaults 时更多地是使用 standardUserDefaults，
//    但是这里我们需要这两个数据能够被扩展访问到的话，我们必须使用在 App Groups 中定义的名字来使用 NSUserDefaults。
    self.groupDefauls = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.youmi.productList"];
    [self applicationWillResignActive];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSURL * url = [NSURL URLWithString:@"todayExtension://yyyyy"];//无法唤醒
//    if ([[UIApplication sharedApplication]canOpenURL:url]) {
//        NSLog(@"ddddddddddd");
//        [[UIApplication sharedApplication]openURL:url];
//    }
}



//TODO:拓展数据共享：Entension Part
- (void)applicationWillResignActive{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSString * str = @"http://api.map.baidu.com/telematics/v3/weather?location=嘉兴&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ";
    NSString * requestString = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:requestString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject = %@", responseObject);
        NSString * dateString = [NSDate date].description;
        [_groupDefauls setValue:[responseObject description] forKey:@"group.com.youmi.today"];
        [_groupDefauls synchronize];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
