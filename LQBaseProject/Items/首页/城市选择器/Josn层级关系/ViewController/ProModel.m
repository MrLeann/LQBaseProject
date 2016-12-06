//
//  ProModel.m
//  LQBaseProject
//
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "ProModel.h"

@implementation ProModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.TextName = dic[@"TextName"];
    }
    
    return self;
}


@end
