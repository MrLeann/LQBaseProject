//
//  UITextField+MyPlace.h
//  virtualdeal
//
//  Created by yzr on 16/6/15.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (MyPlace)

#pragma mark - 自定义tf占位  str = 文字   color  文字颜色     width 留多少左空隙 一般10
-(void)myPlace:(NSString *)str color:(UIColor *)color width:(CGFloat)width;

-(void)addTwo:(UIViewController *)vc tfChanged:(SEL)tfChanged tfClick:(SEL)tfClick;

@end
