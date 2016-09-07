//
//  NSArray+LQAdd.m
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "NSArray+LQAdd.h"

@implementation NSArray (LQAdd)



#pragma mark - 判断数组是否为空
+(BOOL)mIsEmpty:(NSArray *)arr{
    
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
