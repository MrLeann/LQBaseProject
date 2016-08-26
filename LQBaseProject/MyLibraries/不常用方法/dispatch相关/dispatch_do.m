//
//  dispatch_do.m
//  SpotOption
//
//  Created by yzr on 16/7/29.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "dispatch_do.h"
#import <UIKit/UIKit.h>


@implementation dispatch_do

+ (void)delayTime:(CGFloat)time doSome:(void (^)(id doSome))doSome
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        doSome(DISPATCH_TIME_NOW);
        
    });
    
}

@end

