//
//  ProvinceModel.h
//  LQBaseProject
//
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceModel : NSObject

/**
 *  省份名称
 */
@property (nonatomic, copy)NSString *name;
/**
 *  该省中所有的城市
 */
@property (nonatomic, strong)NSArray *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)provinceWithDict:(NSDictionary *)dict;


@end
