//
//  NSString+LQAdd.m
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "NSString+LQAdd.h"

@implementation NSString (LQAdd)



#pragma mark - 判断字符串是否为空对象或者为空
+(BOOL)mIsEmpty:(NSString *)str{
    BOOL isExist = YES;
    //字符串为空就执行
    if  (str.length == 0||str == nil || str == NULL || [str isKindOfClass:[NSNull class]] || [str isEqualToString:@""] || [str isEqualToString:@"<null>"]){
        isExist = NO;
    }
    return isExist;
}


#pragma mark - NSString 格式化
+(NSString *)mFormat:(id)str{
    NSString *string = [NSString stringWithFormat:@"%@",str];
    return string;
}

#pragma mark -  任意整数转字符串
+(NSString *)mFormatzd:(NSInteger)str{
    return [NSString stringWithFormat:@"%zd",str];
}

#pragma mark - 字符串是否是null 或则<null>
+(NSString *)mStrIsNull:(id)str{
    
    if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"]) {
        return @"后台没加 !!";
    }else if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"null"])
    {
        return @"key错了!!";
    }
    return str;
}


@end
