//
//  MyStr.h
//  virtualdeal
//
//  Created by yzr on 16/6/17.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStr : NSObject

+(NSString *)str:(id)str;

+(BOOL)isNull:(id)str;

+(NSString *)fStr:(id)str;

+(NSString *)dStr:(NSInteger)str;

+(NSString *)dateAllStr:(id)str;

+(NSString *)tStr:(id)str;

+(NSString *)nonnullStr:(NSString *)str;

+(NSString *)zeroStr:(id)str;

@end
