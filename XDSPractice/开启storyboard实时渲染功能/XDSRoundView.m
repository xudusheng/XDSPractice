//
//  XDSRoundView.m
//  XDSPractice
//
//  Created by zhengda on 16/2/1.
//  Copyright © 2016年 zhengda. All rights reserved.
//

#import "XDSRoundView.h"

IB_DESIGNABLE
@implementation XDSRoundView
- (void)setCornerRadio:(CGFloat)cornerRadio{
    self.layer.cornerRadius = (cornerRadio < 0)?0:cornerRadio;
    self.layer.masksToBounds = (cornerRadio > 0);
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = (borderWidth < 0)?0:borderWidth;
}
- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}
@end
