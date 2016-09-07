//
//  UIButton+LQAdd.h
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LQAdd)

#pragma mark - 按钮一行设置
-(instancetype)mTitleColor:(UIColor *)color selectColor:(UIColor *)selectColor title:(NSString *)title font:(CGFloat)font Target:(id)target Action:(SEL)action backColor:(UIColor *)backColor;


#pragma mark - 设置边框(宽和颜色)
-(void)setBorder:(UIColor *)color width:(CGFloat)width;







@end
