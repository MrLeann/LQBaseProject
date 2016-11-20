//
//  ImageHeightHandle.m
//  NewCloud
//
//  Created by zhuxiaohui on 2016/11/14.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "ImageHeightHandle.h"


@implementation ImageHeightHandle


+(NSDictionary *)imageSizeWithUrl:(NSString *)url
{
    if(url==nil) return nil;
    NSArray *array = [url componentsSeparatedByString:@"?"];
    NSString *size = [array lastObject];
    NSArray *sizeArray = [size componentsSeparatedByString:@"*"];

    if(sizeArray.count==2)
    {
        NSString * width = sizeArray.firstObject;
        NSString * height =sizeArray.lastObject;
        if(width.length>0 && height.length>0)
        {
            NSDictionary *dic = @{@"width":width,@"height":height};
            return dic;
        }
    }
    return nil;
}

+(CGFloat )imageHeightWithUrl:(NSString *)url imageWidth:(CGFloat )imageWidth defaultHeight:(CGFloat)defaultHeight
{
    CGFloat imageHeight = defaultHeight;
    NSDictionary *dic = [self imageSizeWithUrl:url];
    if(dic)
    {
        CGFloat width = [dic[@"width"] floatValue];
        CGFloat height = [dic[@"height"] floatValue];
        if(width>0 && height>0)//宽高获取成功
        {
            imageHeight = imageWidth/width*height;//计算实际显示高度
        }
    }
    
    return imageHeight;
}

@end
