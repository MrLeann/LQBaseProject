//
//  UIView+Frame.m
//  frame
//
//  Created by yzr on 16/6/24.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


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

@end
