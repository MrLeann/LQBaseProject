//
//  LQHudView.h
//  NewCloud
//
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQHudView : UIView

/**
 *  初始化
 */
+(instancetype)showHud;


/**
 *  隐藏菊花Toast
 */
+(void)hide:(UIViewController *)vc;


@end
