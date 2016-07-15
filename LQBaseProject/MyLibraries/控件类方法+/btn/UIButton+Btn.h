//
//  UIButton+Btn.h
//  按钮封装
//
//  Created by yzr on 16/5/23.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Btn)

-(instancetype)isTitleColor:(UIColor *)color selectColor:(UIColor *)selectColor title:(NSString *)title font:(CGFloat)font Target:(id)target Action:(SEL)action backColor:(UIColor *)backColor;

#pragma mark - 设置按钮边框
-(void)setBorder:(UIColor *)color width:(CGFloat)width;

#pragma mark - 图上字下按钮
-(void)setVerticalImageY:(CGFloat)imageY textY:(CGFloat)textY;

#pragma mark - 偏移量可再调，防止UI切图有问题
-(void)setVerticalImageX:(CGFloat)imageX imageY:(CGFloat)imageY textX:(CGFloat)textX textY:(CGFloat)textY;
@end
