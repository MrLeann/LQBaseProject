//
//  AdaptLabel.m
//  jiexi
//
//  Created by yzr on 16/6/21.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "AdaptText.h"

@implementation AdaptText

#pragma mark - 自适应高度
+(CGFloat)setHeight:(NSString *)string lineSpace:(CGFloat)lf paraSpace:(CGFloat)pf alignment:(NSInteger)index kerSpace:(CGFloat)ker font:(NSInteger)fontIndex toLeft:(CGFloat)toLeft toRight:(CGFloat)toRight
{
    //文字、行距(5.0)、段距(5.0)、对齐方式(2) 、字间距(1.5)
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc]init];
    para.lineSpacing = lf;   //行距
    para.paragraphSpacing = pf; // 段距
    if (index == 1) {
        para.alignment = NSTextAlignmentRight; // 居右    //因为弄了这种样式textAlignment 无效了 所以要在这设置
    }else if (index == 2){
        para.alignment = NSTextAlignmentCenter; // 居中
    }else  para.alignment = NSTextAlignmentLeft; // 居左
    
    //屏幕宽减去 左边距和右边距 在该字体、该段落样式、该字间距下的 文字高度
    CGRect titleRect = [string boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - toLeft - toRight, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontIndex],NSKernAttributeName: @(ker),                                                   NSParagraphStyleAttributeName: para    //字体、字间距。段落样式
                                                                                                                                                                                             } context:nil];
    
    return titleRect.size.height;
}

#pragma mark - 自适应宽度
+(CGFloat)setWith:(NSString *)string forFont:(NSInteger)fontIndex
{
    CGRect titleRect = [string boundingRectWithSize:CGSizeMake(10000, fontIndex + 10) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontIndex]} context:nil];
    
    return titleRect.size.width;
}
+(CGFloat)setWith:(NSString *)string BoldFont:(NSInteger)BoldFontIndex
{
    CGRect titleRect = [string boundingRectWithSize:CGSizeMake(10000, BoldFontIndex + 10) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:BoldFontIndex]} context:nil];
    
    return titleRect.size.width;
}


+(CGFloat)setWith:(NSString *)string font:(UIFont *)font
{
    CGRect titleRect = [string boundingRectWithSize:CGSizeMake(10000, 22) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    
    return titleRect.size.width;
}

@end
