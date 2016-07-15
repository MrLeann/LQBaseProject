//
//  UIView+Extension.m
//  Sinllia_iPhone2.0
//
//  Created by 王声远 on 15/5/11.
//  Copyright (c) 2015年 Daisy. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


/**
 *  以下是几种画边框 选择方式
 */
-(void)layerForViewWith:(CGFloat)radius AndLineWidth:(CGFloat)width
{
    //画边框1
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:width];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 193/255.0, 194/255.0, 194/255.0, 0.5 });//灰色
  
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0/255.0, 0/255.0, 0/255.0, 0.5 });//黑色
    [self.layer setBorderColor:colorref];
}

-(void)layerForViewWithRadius:(CGFloat)radius AndLineWidth:(CGFloat)width AndColor:(UIColor *)color
{
    //画边框
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:width];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 246/255.0, 58/255.0, 66/255.0, 0.5 });
    [self.layer setBorderColor:colorref];
}

-(void)layerForViewWith:(CGFloat)radius AndLineWidth:(CGFloat)width withR:(CGFloat)r withG:(CGFloat)g withB:(CGFloat)b
{
    //画边框
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:width];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ r/255.0, g/255.0, b/255.0, 0.5 });
    [self.layer setBorderColor:colorref];
}

-(void)layerWithRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth color:(UIColor *)color
{
    //画边框
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:lineWidth];
    [self.layer setBorderColor:color.CGColor];
}

@end
