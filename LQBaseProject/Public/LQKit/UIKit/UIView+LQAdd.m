//
//  UIView+LQAdd.m
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "UIView+LQAdd.h"

@implementation UIView (LQAdd)

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.height = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.size.height = x;
    self.frame = frame;
}


-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.size.height = y;
    self.frame = frame;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(CGFloat)YaddH
{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setTopCorner:(CGFloat)corner
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight  cornerRadii:CGSizeMake(corner, corner)].CGPath;
    self.layer.mask = shapeLayer;
}
-(void)setBottomCorner:(CGFloat)corner
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(corner, corner)].CGPath;
    self.layer.mask = shapeLayer;
}

-(void)setAllCorner:(CGFloat)corner
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(corner, corner)].CGPath;
    self.layer.mask = shapeLayer;
}


@end
