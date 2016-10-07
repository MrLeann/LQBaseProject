//
//  UIView+LQAdd.h
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LQAdd)

@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;

-(CGFloat)YaddH;



-(void)setTopCorner:(CGFloat)corner;//上面2角切圆
-(void)setBottomCorner:(CGFloat)corner; //下面2角切圆
-(void)setAllCorner:(CGFloat)corner; //所有角切圆




@end
