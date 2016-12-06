//  SelectDistrictView.h
//  LQBaseProject
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.

#import <UIKit/UIKit.h>

@interface SelectDistrictView : UIView

//初始化
-(instancetype)initWithDistrictView:(CGRect)rect selectTitle:(NSString *)title;

//显示动画
-(void)showCityView:(void(^)(NSString *proviceStr,NSString *cityStr,NSString *distr))selectStr;


@end