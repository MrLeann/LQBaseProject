//
//  Exist.m
//  NewCloud
//
//  Created by yzr on 16/6/28.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "Exist.h"

@implementation Exist

+(BOOL)str:(NSString *)str
{
    BOOL isExist = YES;
    
    //字符串为空就执行
    if  (str == nil || str == NULL || [str isKindOfClass:[NSNull class]] || [str isEqualToString:@""] || [str isEqualToString:@"<null>"])
    {
        isExist = NO;        
    }
    return isExist;
}

+(BOOL)arr:(NSArray *)arr
{
    BOOL isExist = YES;
    
//    NSString *str = [NSString stringWithFormat:@"%@",self];
    // 数组为空就执行
    if (arr == nil || [arr isKindOfClass:[NSNull class]] || arr.count == 0 || arr == NULL )
    {
        isExist = NO;
    }
    
    return isExist;
}


@end
