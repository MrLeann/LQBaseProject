//
//  UIImageView+LQAdd.h
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LQAdd)


//普通二维码
-(void)setTwoCode:(NSString *)str;

//带logo二维码
-(void)setLogoCode:(NSString *)str imageStr:(NSString *)imageStr vc:(UIViewController *)vc;

//彩色二维码
-(void)setColorCode:(NSString *)str colorArr1:(NSArray *)colorArr1 colorArr2:(NSArray *)colorArr2;


@end
