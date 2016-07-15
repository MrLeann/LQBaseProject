//
//  UIImage+TCRendering.h
//  NewCloud
//
//  Created by yzr on 16/4/23.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TCRendering)


+ (instancetype)originalRenderingImageWithName:(NSString *)imageName;

- (instancetype)originalImage;


/**
 *  返回的UIImage 对象
 *  对传入的图片进行中间部位拉伸（像素复制），周边部分不拉伸
 *  应用：QQ聊天气泡类中
 */
+(id)strethImageWith:(NSString *)imageName;


@end
