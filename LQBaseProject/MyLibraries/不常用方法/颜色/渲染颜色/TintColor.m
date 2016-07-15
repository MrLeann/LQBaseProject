//
//  TintColor.m
//  DPScrollPageControllerDemo
//
//  Created by yzr on 16/6/28.
//  Copyright © 2016年 dancewithpeng@gmail.com. All rights reserved.
//

#import "TintColor.h"


@implementation TintColor

+(void)setBtn:(UIButton *)btn image:(NSString *)imageNamed color:(UIColor *)color
{
    UIImage * theImage = [UIImage imageNamed:imageNamed];
     theImage = [theImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [btn setImage:theImage forState:UIControlStateNormal];
     btn.tintColor = color;

}

+(void)setImageV:(UIImageView *)imageV image:(NSString *)imageNamed color:(UIColor *)color
{
    UIImage * theImage = [UIImage imageNamed:imageNamed];
    theImage = [theImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageV setImage:theImage];
    imageV.tintColor = color;
}

@end
