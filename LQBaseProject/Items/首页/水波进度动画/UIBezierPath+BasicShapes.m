//
//  ViewController.h
//  动画+height+
//
//  Created by yzr on 16/6/29.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "UIBezierPath+BasicShapes.h"

@implementation UIBezierPath (BasicShapes)

//根据比较短的边长来定制圆的直径
+ (CGRect)maximumSquareFrameThatFits:(CGRect)frame; {
    CGFloat a = MIN(frame.size.width, frame.size.height);
    return CGRectMake(frame.size.width/2 - a/2, frame.size.height/2 - a/2, a, a);
}

//画圆
+ (UIBezierPath *)circleShape:(CGRect)originalFrame {
    CGRect frame = [self maximumSquareFrameThatFits:originalFrame];
    UIBezierPath* bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.width/2, frame.size.height/2) radius:frame.size.width/2 startAngle:0 endAngle:2*M_PI clockwise:YES];
    return bezierPath;
}

@end
