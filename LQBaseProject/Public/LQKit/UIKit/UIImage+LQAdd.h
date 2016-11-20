//
//  UIImage+LQAdd.h
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LQAdd)

#pragma mark - 方法一：
+ (instancetype)mOriginalRenderingImageWithName:(NSString *)imageName;

#pragma mark - 方法二：
- (instancetype)mOriginalImage;


//对图片中间部分拉伸，周围保持不变
#pragma mark - 对图片中间部分拉伸，周围保持不变
+(id)mStrethImageWith:(NSString *)imageName;



//修改image的大小

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

// 控件截屏
+ (UIImage *)imageWithCaputureView:(UIView *)view;





@end
