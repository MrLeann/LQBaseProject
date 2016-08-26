//
//  UIView+Frame.h
//  frame
//
//  Created by yzr on 16/6/24.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;

-(CGFloat)YaddH;

-(void)setTopCorner:(CGFloat)corner;//上面2角切圆
-(void)setBottomCorner:(CGFloat)corner; //下面2角切圆
-(void)setAllCorner:(CGFloat)corner; //所有角切圆

@end
