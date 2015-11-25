//
//  XDSModelViewController.m
//  XDSPractice
//
//  Created by zhengda on 15/11/19.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "XDSModelViewController.h"

@interface XDSModelViewController ()

@end

@implementation XDSModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 130, 200)];
    [self.view addSubview:button];
}



-(void)dismissViewController {
    [self.delegate dismissViewController:self];
}

@end
