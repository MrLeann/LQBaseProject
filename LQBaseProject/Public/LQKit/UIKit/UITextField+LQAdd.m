//
//  UITextField+LQAdd.m
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "UITextField+LQAdd.h"

@implementation UITextField (LQAdd)


-(void)myPlace:(NSString *)str color:(UIColor *)color width:(CGFloat)width{
    
    
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName: color}];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}


-(void)addTwo:(UIViewController *)vc tfChanged:(SEL)tfChanged tfClick:(SEL)tfClick{
    
    
    [self addTarget:vc action:tfClick forControlEvents:UIControlEventEditingDidBegin];//文本框点击事件，只执行一次
    [self addTarget:vc action:tfChanged forControlEvents:UIControlEventEditingChanged];
    
}


@end
