//
//  TCLoad.m
//  夜间模式
//
//  Created by yzr on 16/5/17.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "TCLoadView.h"

@implementation TCLoadView


+(instancetype)addTCLoad
{
     TCLoadView *loadVieww = [[TCLoadView alloc]init];
    
    
       loadVieww.frame  =  CGRectMake([UIScreen mainScreen].bounds.size.width/2- 25,[UIScreen mainScreen].bounds.size.height/2- 50 , 50, 50);
    
      loadVieww.tag = 55;
     // loadVieww.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:0.3];
       //loadVieww.layer.cornerRadius = 4;
    
       UIActivityIndicatorView *juhua = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        juhua.frame = CGRectMake(15, 15, 20, 20);
        juhua.color = [UIColor whiteColor];
    
     loadVieww.hidden = YES;

        [loadVieww addSubview:juhua];
        [juhua startAnimating];

    
   return loadVieww;
}

+(void)show:(UIViewController *)vc
{
    for (UIView *obj in vc.view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
 
            if (obj.tag == 55) {
                
                obj.hidden = NO;
            }
        }
    }
    
}

+(void)hide:(UIViewController *)vc
{
    for (UIView *obj in vc.view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            if (obj.tag == 55) {
               
                obj.hidden = YES;
            }
        }
    }
    
}

@end
