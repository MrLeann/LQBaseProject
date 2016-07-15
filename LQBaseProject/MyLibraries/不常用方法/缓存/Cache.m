//
//  Cache.m
//  快速缓存
//
//  Created by yzr on 16/5/10.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "Cache.h"

@implementation Cache

+(NSMutableArray *)initWithArr:(NSArray *)arr andKeyArr:(NSArray *)keyArr
{
    NSMutableArray * data  = [[NSMutableArray alloc]init];
    NSMutableArray * mutArr = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in arr) {
        NSMutableDictionary *dictionary = [[NSMutableDictionary dictionary]init];
        
        [mutArr removeAllObjects];
        for (NSInteger i = 0; i < keyArr.count; i++) {
             NSString * str = [NSString stringWithFormat:@"%@",dic[keyArr[i]]];
            [mutArr addObject:str];
        }
      
        for (NSInteger i = 0; i < keyArr.count; i++) {
            
            if ([self isKong:mutArr[i]] == YES) {
                [dictionary setObject:@"" forKey:keyArr[i]];
            }else   [dictionary setObject:mutArr[i] forKey:keyArr[i]];
            
        }
        
        [data addObject:dictionary];
        
        // [[NSUserDefaults standardUserDefaults] setObject:self.data forKey:@"HomeDetailVC"];
    }

    
    return data;
}

#pragma mark - 判断字符串是否为空
+(BOOL)isKong:(NSString *)str
{
    BOOL iskong = NO;
    
    //字符串为空就执行
    if  (str == nil || str == NULL || [str isKindOfClass:[NSNull class]] || [str isEqualToString:@""] || [str isEqualToString:@"<null>"])
    {
        iskong = YES;
        
    }
    return iskong;
}

@end
