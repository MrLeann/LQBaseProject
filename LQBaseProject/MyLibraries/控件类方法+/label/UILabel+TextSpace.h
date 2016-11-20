//
//  UILabel+TextSpece.h
//  间距行距字体封装居中封装
//
//  Created by yzr on 16/5/11.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (TextSpace)

#pragma mark - 文字样式
-(void)setSpace:(NSString *)labelText lineSpace:(CGFloat)lf paraSpace:(CGFloat)pf alignment:(NSInteger)index kerSpace:(CGFloat)ker;

#pragma mark - 范围内字体大小改变
//参数  对齐方式 2居中 3居右 其他居左     范围内字体大小     从第几位开始， 多长字符串改变     范围内颜色
-(void)setRangeSize:(NSInteger)Alignment font:(CGFloat)font starIndex:(NSInteger)starIndex index:(NSInteger)index rangeColor:(UIColor*)color;

#pragma mark - 设置label
-(void)isText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font textAlignment:(NSInteger)index backColor:(UIColor *)backColor;

#pragma mark - 设置范围内颜色和字体
-(void)setFont:(CGFloat)font starIndex:(NSInteger)starIndex Index:(NSInteger)index Color:(UIColor*)color;

@end