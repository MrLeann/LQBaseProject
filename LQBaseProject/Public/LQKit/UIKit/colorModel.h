//
//  colorModel.h
//  Kline
//
//  Created by YZR on 16-9-7.
//  Copyright (c) 2016年 YZR. All rights reserved.

/**
 *      主要用于颜色类16进制转换的模型
 */


#import <Foundation/Foundation.h>



@interface colorModel : NSObject

@property (nonatomic,assign) int R;
@property (nonatomic,assign) int G;
@property (nonatomic,assign) int B;
@property (nonatomic,assign) CGFloat alpha;

@end
