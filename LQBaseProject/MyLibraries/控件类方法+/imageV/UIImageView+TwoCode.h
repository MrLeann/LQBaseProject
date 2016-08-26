//
//  UIImageView+TwoCode.h
//  生成二维码
//
//  Created by yzr on 16/7/19.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (TwoCode)

//普通二维码
-(void)setTwoCode:(NSString *)str;

//带logo二维码
-(void)setLogoCode:(NSString *)str imageStr:(NSString *)imageStr vc:(UIViewController *)vc;

//彩色二维码
-(void)setColorCode:(NSString *)str colorArr1:(NSArray *)colorArr1 colorArr2:(NSArray *)colorArr2;

@end
