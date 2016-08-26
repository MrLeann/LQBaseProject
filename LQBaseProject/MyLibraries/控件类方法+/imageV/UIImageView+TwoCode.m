//
//  UIImageView+TwoCode.m
//  生成二维码
//
//  Created by yzr on 16/7/19.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "UIImageView+TwoCode.h"

@implementation UIImageView (TwoCode)

#pragma mark - 普通二维码

-(void)setTwoCode:(NSString *)str
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    NSData *imageData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [filter setValue:imageData forKey:@"inputMessage"];
    
    //得到图片
    CIImage *image = [filter outputImage];
    
    //放大
    image = [image imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    self.image = [UIImage imageWithCIImage:image];

}

#pragma mark - 带logo二维码
-(void)setLogoCode:(NSString *)str imageStr:(NSString *)imageStr vc:(UIViewController *)vc
{
    UIView * v = [[UIView alloc]initWithFrame:self.frame];
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGFloat with  = self.frame.size.width/6;
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake((with*6 - with)/2, (with*6 - with)/2, with, with)];
    [imageV setImage:[UIImage imageNamed:imageStr]];
    
    [v addSubview:self];
    [v addSubview:imageV];
    
    [vc.view addSubview:v];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    NSData *imageData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [filter setValue:imageData forKey:@"inputMessage"];
    
    //得到图片
    CIImage *image = [filter outputImage];
    
    //放大
    image = [image imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    self.image = [UIImage imageWithCIImage:image];
    
}

#pragma mark - 彩色二维码
-(void)setColorCode:(NSString *)str colorArr1:(NSArray *)colorArr1 colorArr2:(NSArray *)colorArr2
{
    //创建二维码过滤器
    CIFilter * qrfilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [qrfilter setDefaults];

    NSData * qrimgardata = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [qrfilter setValue:qrimgardata forKey:@"inputMessage"];
    
    CIImage *qrImage = qrfilter.outputImage;
    
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    CIFilter * colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    
    //设置默认值
    [colorFilter setDefaults];

    [colorFilter setValue:qrImage forKey:@"inputImage"];
    
    //CIColor
    [colorFilter setValue:[CIColor colorWithRed:[colorArr1[0] integerValue] green:[colorArr1[1] integerValue] blue:[colorArr1[2] integerValue]] forKey:@"inputColor0"];
    [colorFilter setValue:[CIColor colorWithRed:[colorArr2[0] integerValue] green:[colorArr2[1] integerValue] blue:[colorArr2[2] integerValue]] forKey:@"inputColor1"];
    
    //设置输出
    CIImage *colorImage = [colorFilter outputImage];
    
    self.image = [UIImage imageWithCIImage:colorImage];

}

@end
