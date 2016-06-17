//
//  XDSHotfixViewController.m
//  XDSPractice
//
//  Created by zhengda on 16/6/1.
//  Copyright © 2016年 zhengda. All rights reserved.
//

#import "XDSHotfixViewController.h"
@interface XDSHotfixViewController ()
@property (strong, nonatomic)UIWindow * window;
@end

@implementation XDSHotfixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor yellowColor];
    _window.windowLevel = UIWindowLevelAlert;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%2ld行", indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor yellowColor];
    _window.rootViewController = viewController;
    [_window makeKeyAndVisible];
    
}
@end
