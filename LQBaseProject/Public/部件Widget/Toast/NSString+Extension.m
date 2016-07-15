//
//  NSString+Extension.m
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

//返回字符串的尺寸
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (NSString *) throwExceptionString
{
    return self;
}

//不区分大小写是否包含某个字符
- (BOOL)containsStringWith:(NSString *)str
{
    if([self rangeOfString:str options:NSCaseInsensitiveSearch].location != NSNotFound)
    {
        return YES;
    }
    return NO;
}

//判断某个字符串包含某些特殊字符开头的，不区分大小写
- (BOOL) hasStringWithPrefix:(NSString *)aString
{
    NSRange range = [self rangeOfString:aString options:NSCaseInsensitiveSearch];
    
    NSLog(@"NSRange: %@",NSStringFromRange(range));
    
    if (range.location == 0 && range.length == aString.length) {
        return YES;
    }
    return NO;
}

@end
