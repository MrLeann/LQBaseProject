//
//  UIColor+LQAdd.h
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LQColorModel;//另外的一个颜色模型

@interface UIColor (LQAdd)

/**
 *   返回随机颜色
 */
+(instancetype)randColor;

/**
 *  将16进制字符串转换成UIColor （无模型版本）
 */
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

#pragma mark - 输入十六进制代码 转化为UIColor 对象
+(UIColor *)mColorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;

#pragma mark - 输入十六进制代码 转化为colorModel 模型（对象RGB数字）
+ (LQColorModel *)mRGBWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;

@end

