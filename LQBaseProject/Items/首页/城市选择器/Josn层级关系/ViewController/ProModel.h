//
//  ProModel.h
//  LQBaseProject
//
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProModel : NSObject

@property(nonatomic,copy)NSString *TextName;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
