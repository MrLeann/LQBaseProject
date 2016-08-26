//
//  UIButton+Btn.h
//  按钮封装
//
//  Created by yzr on 16/5/23.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Btn)

#pragma mark - 按钮属性一行设置
-(instancetype)isTitleColor:(UIColor *)color selectColor:(UIColor *)selectColor title:(NSString *)title font:(CGFloat)font Target:(id)target Action:(SEL)action backColor:(UIColor *)backColor;

#pragma mark - 设置按钮边框
-(void)setBorder:(UIColor *)color width:(CGFloat)width;

#pragma mark - 图上字下按钮
-(void)setVerticalImageY:(CGFloat)imageY textY:(CGFloat)textY;

#pragma mark - 偏移量可再调，防止UI切图有问题
-(void)setVerticalImageX:(CGFloat)imageX imageY:(CGFloat)imageY textX:(CGFloat)textX textY:(CGFloat)textY;

-(void)setHighlight;//设置按钮高亮

-(void)setLoadFont:(CGFloat)font; //刷新按钮文字图片位置

-(CGFloat)setWith:(NSString *)string forFont:(NSInteger)fontIndex; //获取按钮文字宽度

@end
