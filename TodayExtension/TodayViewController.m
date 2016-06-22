//
//  TodayViewController.m
//  TodayExtension
//
//  Created by zhengda on 16/6/22.
//  Copyright © 2016年 zhengda. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"

@interface TodayViewController () <NCWidgetProviding, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)NSUserDefaults * groupDefauls;
@property (strong, nonatomic)UITableView * tableView;
@property (strong, nonatomic)UILabel * footLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect frame = [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    self.footLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 40)];
    _footLabel.backgroundColor = [UIColor yellowColor];
//    self.tableView.tableFooterView = _footLabel;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 40);
    button.showsTouchWhenHighlighted = YES;
    [button setTitle:@"查看更多" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _tableView.tableFooterView = button;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSString * today = [_groupDefauls stringForKey:@"group.com.youmi.today"];
//    _footLabel.text = today;
    //[_tableView reloadData];
    [self request];
}

- (void)buttonClick:(UIButton *)button{
    [self.extensionContext openURL:[NSURL URLWithString:@"youmitoday://xxxxxxxx"] completionHandler:^(BOOL success) {
        _tableView.tableFooterView = _footLabel;
        _footLabel.text = @(success).stringValue;
    }];
}

- (void)request{
//    http://suggest.taobao.com/sug?code=utf-8&q=商品关键字&callback=cb
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSString * str = @"http://api.map.baidu.com/telematics/v3/weather?location=嘉兴&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ";
    NSString * requestString = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:requestString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject = %@", responseObject);
        _footLabel.text = [[responseObject class] description];
        [_tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSInteger title = arc4random()%100+100;
    NSArray * imageArr = @[
                           @"http://zkres.myzaker.com/201605/5730f7fe1bc8e08b60000006_120.jpg",
                           @"http://zkres.myzaker.com/201605/5730f7fe1bc8e08b60000006_120.jpg",
                           @"http://zkres.myzaker.com/201605/5730f7fe1bc8e08b60000006_120.jpg",
                           @"http://zkres.myzaker.com/201605/5730f7fe1bc8e08b60000006_120.jpg"
                           ];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[imageArr[indexPath.row] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"Torchwood"]];
    cell.textLabel.text = @(title).stringValue;
    return cell;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsZero;
}

@end
