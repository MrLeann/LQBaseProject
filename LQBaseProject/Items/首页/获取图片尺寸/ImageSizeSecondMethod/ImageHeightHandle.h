//
//  ImageHeightHandle.h
//  NewCloud
//
//  Created by zhuxiaohui on 2016/11/14.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageHeightHandle : NSObject

/*
 图片解析格式:
 http://productresource.oss-cn-shenzhen.aliyuncs.com/Product/a8a85ca3-0b3d-4f78-ad85-49ba7956acd3/BigImage_a8a85ca3-0b3d-4f78-ad85-49ba7956acd3.jpg?350*400
 */


/**
 *  图片显示高度计算
 *
 *  @param url           图片url
 *  @param imageWidth    图片适配宽度
 *  @param defaultHeight 获取高度失败,高度默认值
 *
 *  @return 图片要显示的高度
 */
+(CGFloat )imageHeightWithUrl:(NSString *)url imageWidth:(CGFloat )imageWidth defaultHeight:(CGFloat)defaultHeight;

@end
