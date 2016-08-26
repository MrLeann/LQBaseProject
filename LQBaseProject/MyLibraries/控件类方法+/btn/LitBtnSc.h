//
//  LitBtnSc.h
//  GCBWallet
//
//  Created by yzr on 16/8/18.
//  Copyright © 2016年 YZR. All rights reserved.
//  这个是放在UIScrollView 控件上的，点击是UIButton 控件

#import <UIKit/UIKit.h>

@interface LitBtnSc : UIScrollView


@property (nonatomic, strong)UIColor *vColor; //btnView背景颜色
@property (nonatomic, strong)UIColor *BNBColor;  //按钮未选中背景颜色
@property (nonatomic, strong)UIColor *BSBColor;  //按钮选中背景颜色
@property (nonatomic, strong)UIColor *BNTColor;  //按钮未选中文字颜色
@property (nonatomic, strong)UIColor *BSTColor; //按钮选中文字颜色
@property (nonatomic, strong)UIColor *lineColor; //指示器颜色

@property (nonatomic, strong)UIButton *delegateBtn;

@property (nonatomic, assign)CGFloat myHeight;

@property (nonatomic, assign)BOOL isEnabled;


-(void)setScColor:(UIColor *)VBcolor btnBackColor:(UIColor *)BNBColor btnSelectBackColor:(UIColor *)BSBColor btnTextColor:(UIColor *)BNTColor btnSelectTextColor:(UIColor *)BSTColor lineColor:(UIColor *)lineColor;

-(void)setView:(UIView *)view arr:(NSArray *)arr action:(SEL)action Alignment:(NSInteger)Alignment selectIndex:(NSInteger)selectIndex space:(CGFloat)space font:(CGFloat)font vc:(UIViewController *)vc delegateBtn:(UIButton *)delegateBtn isTap:(BOOL)isTap;

-(void)hide;

-(void)show;


@end
