//  ToolClass.h
//  Xuebei
//  Created by maceasy on 15/11/27.
//  Copyright © 2015年 macHY. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolClass : NSObject

/**
 *    获取iPhone版本
 */
#pragma mark - 获取iPhone版本
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
#pragma mark - 判断字符串是否为
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
#pragma mark - 判断是否以字母开头
+(BOOL)mJudgeIsLetterFirst:(NSString *)str;


/**
 *   判断是否以中文开头
 */
//+(BOOL)mJudgeIsChineseFirst:(NSString *)str;



/**
 *    NSString输入减一个字符
 */
#pragma mark - NSString输入减一个字符
+(NSString *)mInputReduceCharacter:(NSString *)str;



/**
 *    字符串删去掉 首尾空格 （能用）
 */
#pragma mark - 字符串删去掉 首尾空格 （能用）
+(NSString *)mDeleteBeginningAndEndSpace:(NSString *)str;



/**
 *    字符串去掉 空格、换行和括号(能用)
 */
#pragma mark - 字符串去掉 空格、换行和括号(能用)
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
#pragma mark - 获取本机的UUID
+(NSString *)mGetUUID;



/**
 *  字符串每隔3位添加逗号
 */
#pragma mark - 字符串每隔3位添加逗号
+(NSString *)mCountNumAndChangeformat:(NSString *)num;



/**
 *  单行的UILabel根据文字长度返回size
 */
#pragma mark - 单行的UILabel根据文字长度返回size
+(CGSize)mGetSingleLineSize:(UILabel *)label labelFont:(UIFont *)font;


/**
 *  根据UILabel 的宽，计算一个字符串的Size
 *  labelText 传入的字符串
 *  postLabelMaxWidth 要显示的label 最大宽度
 *  font 字体
 *  space 应该是行距
 */
#pragma mark - 根据字符的宽度返回所在屏幕的高度
+(CGSize)mCalculateVerticalSize:(NSString *)labelText
              postLabelMaxWidth:(CGFloat)postLabelMaxWidth
                           font:(UIFont*)font
                   defaultSpace:(CGFloat)space ;

/**
 *  图片压缩到指定像素尺寸
 *
 *  defineWidth 是指压缩到高、宽 的最大值，200即200像素宽，同样200像素高
 */
#pragma mark - 图片压缩指定尺寸
+(UIImage *)mImageCompressForWidth:(UIImage *)sourceImage
                       targetWidth:(CGFloat)defineWidth;


/**
 *   设置里面选择什么语言的获取
 */
#pragma mark - 获取系统语言
+ (NSString*)mGetSystemLanguage;


/**
 *   字符串中是否包含某个字符串
 */
#pragma mark - 字符串中是否包含某个字符串
+(BOOL)mContainSpecifiedCharacterInString:(NSString *)str
                                Character:(NSString *)charStr;

/**
 *  返回文件目录
 */
#pragma mark - 返回文件目录
+(NSString *)mDocumentPathWith:(NSString *)fileName;



#pragma mark - 缓存数组
+(NSMutableArray *)initWithArr:(NSArray *)arr
                     andKeyArr:(NSArray *)keyArr;


#pragma mark - 遍历View里面的 UIButton 按钮控件
+(NSArray *)mTraversalButtonInView:(UIView *)supView;


#pragma mark - 遍历View里面的View视图 - 返回数组
+(NSArray *)mTraversalViewInView:(UIView *)view;


#pragma mark - 根据tag值获取UIView里面的指定View视图 -返回View
+(UIView *)mTraversalViewInView:(UIView *)view
                        withTag:(NSInteger)tag;

#pragma mark - 获取随机字符串(英文)
+ (NSString *)mGetRandomString;

#pragma mark - 320-375-414 三种屏幕适配
+(CGFloat)mAdapt320and375and41Screen:(NSArray *)arr;

#pragma mark 字符串转换为日期时间对象
+(NSDate*)mDateFromString:(NSString*)str;

#pragma mark - 不知道什么功能
+(bool)isEqualWithFloat:(float)f1 float2:(float)f2 absDelta:(int)absDelta;

#pragma mark - 根据Key值 获取NSUserDefault 对象
+(NSObject *)mGetUserDefaults:(NSString *) name;

#pragma mark - 设置NSUserDefault 对象
+(void)mSetUserDefaults:(NSObject *) defaults
                 forKey:(NSString *) key;

#pragma mark - 数值根据大小变成万、亿的字符串
+(NSString*)mChangePrice:(CGFloat)price;

#pragma mark - MD5 16位加密
+(NSString *)md5HexDigest:(NSString*)password;

#pragma mark - MD5 16位加密
+(NSString *)md5String:(NSString *)str;


#pragma mark - 适配语言
//+(NSString *)languages:(NSArray *)arr;

@end

