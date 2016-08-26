//
//  ForInView.m
//  NewCloud
//
//  Created by yzr on 16/6/21.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "ForInView.h"
#import <UIKit/UIKit.h>

@implementation ForInView

+(NSArray *)supView:(UIView *)supView
{
    NSMutableArray *subArr = [[NSMutableArray alloc]init];
    
    for (id obj in supView.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton* theButton = (UIButton*)obj;
            [subArr addObject:theButton];
        }
    }
    
    return subArr;
}

+(NSArray *)view:(UIView *)view
{
    
    NSMutableArray *subArr = [[NSMutableArray alloc]init];
    
    for (id obj in view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            UIView* v = (UIView*)obj;
            [subArr addObject:v];
        }
    }
    
    return subArr;
}

+(UIView *)setView:(UIView *)view tag:(NSInteger)tag
{
    UIView *vv = [[UIView alloc]init];
    
    for (id obj in view.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UIView class]]) {
            UIView* v = (UIView*)obj;
            
            if (v.tag == tag) {
                
                vv = v;
            }
        }
    }

    
    return vv;
}

@end
