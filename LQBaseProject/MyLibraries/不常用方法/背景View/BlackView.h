//
//  BlackView.h
//  virtualdeal
//
//  Created by yzr on 16/6/14.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlackView : UIView
+(instancetype)addTo:(UIViewController *)vc alpha:(CGFloat)alpha Action:(SEL)action;
+(void)remove:(UIViewController *)vc;

+(instancetype)addHide:(UIViewController *)vc alpha:(CGFloat)alpha Action:(SEL)action;
+(void)show:(UIViewController *)vc;
+(void)hide:(UIViewController *)vc;

@end
