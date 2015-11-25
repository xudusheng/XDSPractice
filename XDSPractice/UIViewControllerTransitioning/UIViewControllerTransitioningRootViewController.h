//
//  UIViewControllerTransitioningRootViewController.h
//  XDSPractice
//
//  Created by zhengda on 15/11/19.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalTransitionAnimation;
@interface UIViewControllerTransitioningRootViewController : UIViewController

@property (strong, nonatomic) ModalTransitionAnimation * animation;

@end
