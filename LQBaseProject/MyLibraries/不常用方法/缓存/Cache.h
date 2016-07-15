//
//  Cache.h
//  快速缓存
//
//  Created by yzr on 16/5/10.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject

+(NSMutableArray *)initWithArr:(NSArray *)arr andKeyArr:(NSArray *)keyArr;
+(BOOL)isKong:(NSString *)str;

@end
