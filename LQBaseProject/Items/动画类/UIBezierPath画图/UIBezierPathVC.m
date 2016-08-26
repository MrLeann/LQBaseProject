//
//  UIBezierPathVC.m
//  LQBaseProject
//
//  Created by YZR on 16/7/23.
//  Copyright © 2016年 YZR. All rights reserved.
//

/**
 *  了解 贝塞尔曲线
 *
 */

#import "UIBezierPathVC.h"

#define   kDegreesToRadians(degrees)  ((pi * degrees)/ 180)

@interface UIBezierPathVC ()

@end

@implementation UIBezierPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mInitUI];
    
}

-(void)mInitUI{
    self.view.backgroundColor = [UIColor whiteColor];
    //反正什么形状都 画不出来，为毛线啊
    
    
    //绘制直线
//    [self mDrawLine];
    
    //画三角形
//    [self mDrawTrianglePath];

     //画矩形
//    [self mDrawRectPath];
    
     //画圆
    [self mDrawCiclePath];
}


#pragma mark - 绘制直线
-(void)mDrawLine{
    
    // 创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 添加路径[1条点(100,100)到点(200,100)的线段]到path
    [path moveToPoint:CGPointMake(100 , 100)];
    [path addLineToPoint:CGPointMake(200, 100)];
    // 将path绘制出来
    [path stroke];
    
    
    // 设置描边色
    [[UIColor blueColor] setStroke];
    // 设置填充色
    [[UIColor redColor] setFill];
}

#pragma mark - 绘制三角形
-(void)mDrawTrianglePath{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    
    [path addLineToPoint:CGPointMake(self.view.frame.size.width - 40, 20)];
    [path addLineToPoint:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 20)];
    
    // 最后的闭合线是可以通过调用closePath方法来自动生成的，也可以调用-addLineToPoint:方法来添加
    //  [path addLineToPoint:CGPointMake(20, 20)];
    
    [path closePath];
    
    // 设置线宽
    path.lineWidth = 1.5;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

#pragma mark - 画矩形
- (void)mDrawRectPath{
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 40)];
    
    path.lineWidth = 1.5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}

#pragma mark - 画圆
- (void)mDrawCiclePath {
    
    // 传的是正方形，因此就可以绘制出圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.width - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}


#pragma mark - 弧线绘制
- (void)drawARCPath {
    
    const CGFloat pi = 3.14159265359;
    
    CGPoint center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:100
                                                    startAngle:0
                                                      endAngle:kDegreesToRadians(135)
                                                     clockwise:YES];
    
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    [path stroke];
}

@end


