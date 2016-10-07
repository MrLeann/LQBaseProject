//
//  LQInputView.h
//  LQBaseProject
//
//  Created by YZR on 16/9/9.
//  Copyright © 2016年 YZR. All rights reserved.

/**
 *   来自小码哥教育：峥呀个峥 （微博）
 */

#import <UIKit/UIKit.h>

@interface LQInputView : UITextView


/**
 *  textView最大行数
 */
@property (nonatomic, assign) NSUInteger maxNumberOfLines;

/**
 *  文字高度改变block → 文字高度改变会自动调用
 *  block参数(text) → 文字内容
 *  block参数(textHeight) → 文字高度
 */
@property (nonatomic, strong) void(^yz_textHeightChangeBlock)(NSString *text,CGFloat textHeight);

/**
 *  设置圆角
 */
@property (nonatomic, assign) NSUInteger cornerRadius;

/**
 *  占位文字
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;




@end
