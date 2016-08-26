//
//  ToolClass.h
//  Xuebei
//
//  Created by maceasy on 15/11/27.
//  Copyright © 2015年 macHY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolClass : NSObject

/**
 *    获取iPhone版本
 */
+(BOOL)mIsIphone4Or4s;
+(BOOL)mIsIphone5;
+(BOOL)mIsIphone6;
+(BOOL)mIsIphone6plus;


/**
 *    获取路径
 */
#pragma mark - 根据文件名获取路径
+(NSString *)mGetLibraryCachesPath:(NSString *)fileName;


/**
 *    删除NSString中特定字符
 */
#pragma mark - 删除NSString中特定字符
+(NSString *)mDeleteDesignatedString:(NSString *)str;


/**
 *    判断字符串是否为空
 *    yes全部为空格，no不是
 */
+(BOOL)mJudgeStringisEmpty:(NSString *)str;


/**
 *    判断 NSString是否为数字
 *    是数字打印1，不是为0
 *    oc里面，ture和YES 是一样可以通过的目前没有明显的编译问题
 */
#pragma mark - 判断 NSString是否为数字
+(BOOL)mJudgePassWordLegal:(NSString *) pass;


/**
 *   判断是否以字母开头
 */
+(BOOL)mJudgeIsLetterFirst:(NSString *)str;


/**
 *   判断是否以中文开头
 */
//+(BOOL)mJudgeIsChineseFirst:(NSString *)str;



/**
 *    NSString输入减一个字符
 */
+(NSString *)mInputReduceCharacter:(NSString *)str;



/**
 *    字符串删去掉 首尾空格 （能用）
 */
+(NSString *)mDeleteBeginningAndEndSpace:(NSString *)str;



/**
 *    字符串去掉 空格、换行和括号(能用)
 */
+(NSString *)mDeleteSpaceAndEnterElementWithString:(NSString *)sourceStr;


/**
 *    字符串 删除所有空格 （能用）
 *    中间和两端
 */
#pragma mark - 字符串 删除所有空格
+(NSString *)mDeleteAllSpaceString:(NSString *)str;




#pragma mark - 绘制虚线
/*
 ** lineFrame:     虚线的 frame
 ** length:        虚线中短线的宽度
 ** spacing:       虚线中短线之间的间距
 ** color:         虚线中短线的颜色
 */
+ (UIView *)mDrawDashedLineWithFrame:(CGRect)lineFrame
                            lineLength:(int)length
                           lineSpacing:(int)spacing
                             lineColor:(UIColor *)color;



/**
 *  获取本机的UUID
 */
+(NSString *)mGetUUID;



/**
 *  字符串每隔3位添加逗号
 */
+(NSString *)mCountNumAndChangeformat:(NSString *)num;



/**
 *  单行的UILabel根据文字长度返回size
 */
+(CGSize)mGetSingleLineSize:(UILabel *)label labelFont:(UIFont *)font;



/**
 *  根据UILabel 的宽，计算一个字符串的Size
 *  labelText 传入的字符串
 *  postLabelMaxWidth 要显示的label 最大宽度
 *  font 字体
 *  space 应该是nsstring距离label 的边界距离（toast传的是5）
 */
+(CGSize)mCalculateVerticalSize:(NSString *)labelText postLabelMaxWidth:(CGFloat)postLabelMaxWidth font:(UIFont*)font defaultSpace:(CGFloat)space ;




/**
 *  图片压缩到指定像素尺寸
 *
 *  defineWidth 是指压缩到高、宽 的最大值，200即200像素宽，同样200像素高
 */
#pragma mark - 图片压缩指定尺寸
+(UIImage *)mImageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;







@end
