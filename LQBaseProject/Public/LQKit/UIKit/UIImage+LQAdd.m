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

/**
 *   修改image的大小
 */
-(UIImage *)imageByScalingToSize:(CGSize)targetSize{

    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor < heightFactor) {
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    // this is actually the interesting part:
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    return newImage ;
}

/**
 *   图片截屏
 */
+(UIImage *)imageWithCaputureView:(UIView *)view{
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 把控件上的图层渲染到上下文,layer只能渲染
    [view.layer renderInContext:ctx];
    // 生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    return image;
}


@end


