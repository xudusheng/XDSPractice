//
//  UIViewControllerTransitioningRootViewController.m
//  XDSPractice
//
//  Created by zhengda on 15/11/19.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import "UIViewControllerTransitioningRootViewController.h"
#import "XDSModelViewController.h"
#import "ModalTransitionAnimation.h"
@interface UIViewControllerTransitioningRootViewController ()<ModelViewControllerDelegate, UIViewControllerTransitioningDelegate>

@end

@implementation UIViewControllerTransitioningRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animation = [[ModalTransitionAnimation alloc] init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 130, 200)];
    [self.view addSubview:button];
}

-(void)pushViewController {
    XDSModelViewController *controller = [[XDSModelViewController alloc] init];
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    controller.delegate = self;
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}


#pragma mark - ModelViewControllerDelegate
-(void)dismissViewController:(XDSModelViewController *)mcv {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return _animation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return _animation;
}

@end
