//
//  NavView.h
//  SpotOption
//
//  Created by yzr on 16/7/4.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavView : NSObject
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)UILabel *titleLabel;

//只左图片
+(void)setOnlyLeft:(NSString *)title vc:(UIViewController *)vc;

//只右图片
+(void)setOnlyRight:(NSString *)title rightImage:(NSString *)rightImage rightAction:(SEL)rightAction vc:(UIViewController *)vc;

//左返回图片+右图片
+(void)setPopTitle:(NSString *)title rightImage:(NSString *)rightImage rightAction:(SEL)rightAction vc:(UIViewController *)vc;

// 全有，左非返回
+(void)setTitle:(NSString *)title leftImage:(NSString *)leftImage rightImage:(NSString *)rightImage rightTitle:(NSString *)rightTitle leftAction:(SEL)leftAction  rightAction:(SEL)rightAction vc:(UIViewController *)vc;

@end
