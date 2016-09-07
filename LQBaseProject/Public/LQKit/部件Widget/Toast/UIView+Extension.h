//
//  UIView+Extension.h
//  Sinllia_iPhone2.0
//
//  Created by 王声远 on 15/5/11.
//  Copyright (c) 2015年 Daisy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

//设置边框颜色
-(void)layerForViewWith:(CGFloat)radius AndLineWidth:(CGFloat)width;

//
-(void)layerForViewWithRadius:(CGFloat)radius AndLineWidth:(CGFloat)width AndColor:(UIColor *)color;
//
-(void)layerForViewWith:(CGFloat)radius AndLineWidth:(CGFloat)width withR:(CGFloat)r withG:(CGFloat)g withB:(CGFloat)b;

//
-(void)layerWithRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth color:(UIColor *)color;


@end
