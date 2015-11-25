//
//  XDSModelViewController.h
//  XDSPractice
//
//  Created by zhengda on 15/11/19.
//  Copyright © 2015年 zhengda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XDSModelViewController;
@protocol ModelViewControllerDelegate <NSObject>
-(void)dismissViewController:(XDSModelViewController *)mcv;
@end

@interface XDSModelViewController : UIViewController

@property(nonatomic,weak)id<ModelViewControllerDelegate> delegate;
@end
