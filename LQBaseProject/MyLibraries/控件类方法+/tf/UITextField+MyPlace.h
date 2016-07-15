//
//  UITextField+MyPlace.h
//  virtualdeal
//
//  Created by yzr on 16/6/15.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (MyPlace)

-(void)myPlace:(NSString *)str color:(UIColor *)color width:(CGFloat)width;
-(void)addTwo:(UIViewController *)vc tfChanged:(SEL)tfChanged tfClick:(SEL)tfClick;


@end
