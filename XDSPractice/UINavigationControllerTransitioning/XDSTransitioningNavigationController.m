//
//  XDSTransitioningNavigationController.m
//  XDSPractice
//
//  Created by zhengda on 15/11/19.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "XDSTransitioningNavigationController.h"
#import "NavigationTransitionAnimation.h"
@interface XDSTransitioningNavigationController ()<UINavigationControllerDelegate, UINavigationBarDelegate>

@property(nonatomic, strong)NavigationTransitionAnimation *animation;

@end

@implementation XDSTransitioningNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    _animation = [[NavigationTransitionAnimation alloc]init];
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC{
    return _animation;
}

//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
//    return _animation;
//}
@end
