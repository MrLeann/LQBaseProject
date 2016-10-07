//
//  LQHudView.m
//  NewCloud
//
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "LQHudView.h"

@implementation LQHudView

// 初始化 Hud
+(instancetype)showHud{

    LQHudView *loadVieww = [[LQHudView alloc]init];
    
    loadVieww.frame  =  CGRectMake([UIScreen mainScreen].bounds.size.width/2- 25,[UIScreen mainScreen].bounds.size.height/2- 50 , 50, 50);
    
    loadVieww.tag = 10055;
    // loadVieww.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:0.3];
    //loadVieww.layer.cornerRadius = 4;
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicatorView.frame = CGRectMake(15, 15, 20, 20);
    activityIndicatorView.color = RGBColor(80, 80, 80);
    
    loadVieww.hidden = NO;
    
    [loadVieww addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    return loadVieww;

}

+(void)hide:(UIViewController *)vc{
    
    //
    for (UIView *obj in vc.view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            if (obj.tag == 10055) {
                
                obj.hidden = YES;
                
                [obj removeFromSuperview];//移除
                
            }
        }
    }
}





@end
