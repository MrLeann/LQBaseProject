


//
//  ProvinceModel.m
//  LQBaseProject
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.

#import "ProvinceModel.h"

@implementation ProvinceModel


// 初始化模型
-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}


@end
