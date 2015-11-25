//
//  XDSTransitioningTabBarController.m
//  XDSPractice
//
//  Created by zhengda on 15/11/19.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "XDSTransitioningTabBarController.h"
#import "TabbarTransitionAnimation.h"
@interface XDSTransitioningTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) TabbarTransitionAnimation * animation;
@end

@implementation XDSTransitioningTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animation = [[TabbarTransitionAnimation alloc]init];
    self.delegate = self;
}


- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC{
    return _animation;
}
@end
