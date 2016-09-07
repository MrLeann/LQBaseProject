//
//  NSString+LQAdd.h
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LQAdd)


#pragma mark - 判断是否为空
//这儿还是类方法，方便使用
+(BOOL)mIsEmpty:(NSString *)str;

#pragma mark - NSString格式化
+(NSString *)mFormat:(id)str;

#pragma mark -  任意整数转字符串
+(NSString *)mFormatzd:(NSInteger)str;

#pragma mark - 字符串是否是null 或则<null>
+(NSString *)mStrIsNull:(id)str;


@end
