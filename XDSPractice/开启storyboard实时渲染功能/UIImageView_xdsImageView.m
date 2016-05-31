//
//  UIImageView_xdsImageView.m
//  UIView_xdsRoundView
//
//  Created by zhengda on 16/2/1.
//  Copyright © 2016年 zhengda. All rights reserved.
//

#import "UIImageView_xdsImageView.h"
IB_DESIGNABLE
@implementation UIImageView_xdsImageView
- (void)setXdsCornerRadio:(CGFloat)xdsCornerRadio{
    _xdsCornerRadio = (xdsCornerRadio < 0)?0:xdsCornerRadio;
    self.layer.cornerRadius = _xdsCornerRadio;
    self.layer.masksToBounds = (_xdsCornerRadio > 0);
}

- (void)setXdsBorderWidth:(CGFloat)xdsBorderWidth{
    _xdsBorderWidth = (xdsBorderWidth < 0)?0:xdsBorderWidth;
    self.layer.borderWidth = _xdsBorderWidth;
}
- (void)setXdsBorderColor:(UIColor *)xdsBorderColor{
    _xdsBorderColor = xdsBorderColor?xdsBorderColor:nil;
    self.layer.borderColor = _xdsBorderColor.CGColor;
}
@end
