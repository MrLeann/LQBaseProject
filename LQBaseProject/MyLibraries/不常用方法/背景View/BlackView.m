//
//  BlackView.m
//  virtualdeal
//
//  Created by yzr on 16/6/14.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "BlackView.h"
#import "MyLibraries.h"

@implementation BlackView

+(instancetype)addTo:(UIViewController *)vc alpha:(CGFloat)alpha Action:(SEL)action
{
    BlackView *b = [[BlackView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    b.backgroundColor = [UIColor blackColor];
    b.alpha = alpha;
    b.userInteractionEnabled = YES;
    b.tag = 1314;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:action];
    
    [b addGestureRecognizer:tap];
    [vc.view addSubview:b];
    
     return b;
}

+(void)remove:(UIViewController *)vc
{
    for (UIView *obj in vc.view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            
            if (obj.tag == 1314) {
                
                [obj removeFromSuperview];
            }
        }
    }
    
}

+(instancetype)addHide:(UIViewController *)vc alpha:(CGFloat)alpha Action:(SEL)action
{
    BlackView *b = [[BlackView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    b.backgroundColor = [UIColor blackColor];
    b.alpha = alpha;
    b.userInteractionEnabled = YES;
    b.tag = 1314 ;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:vc action:action];
    
    [b addGestureRecognizer:tap];
    
    b.hidden = YES;
    
    [vc.view addSubview:b];
    
    return b;

}

+(void)show:(UIViewController *)vc
{
    for (UIView *obj in vc.view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            
            if (obj.tag == 1314) {
                
                obj.hidden = NO;
            }
        }
    }

    
}
+(void)hide:(UIViewController *)vc
{
    for (UIView *obj in vc.view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            
            if (obj.tag == 1314) {
                
                obj.hidden = YES;
            }
        }
    }

    
}


@end
