//
//  UIImage+LQAdd.m
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "UIImage+LQAdd.h"

@implementation UIImage (LQAdd)

#pragma mark - 两个处理方法
+(instancetype)mOriginalRenderingImageWithName:(NSString *)imageName{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

#pragma mark - 两个处理方法
- (instancetype)mOriginalImage{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

#pragma mark - 图片中间拉伸
+(id)mStrethImageWith:(NSString *)imageName{
    
    UIImage *image=[UIImage imageNamed:imageName];
    /**
     这个函数是UIImage的一个实例函数，它的功能是创建一个内容可拉伸，而边角不拉伸的图片，需要两个参数，第一个是不拉伸区域和左边框的宽度，第二个参数是不拉伸区域和上边框的宽度。
     参数的意义是，如果参数指定10，5。那么，图片左边10个像素，上边5个像素。不会被拉伸，x坐标为11和一个像素会被横向复制，y坐标为6的一个像素会被纵向复制。注意：只是对一个像素进行复制到一定宽度。
     */
    image=[image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    return image;
}



@end
