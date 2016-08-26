//
//  LitBtnView.h
//  任意位置的下拉View
//
//  Created by yzr on 16/7/30.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LitBtnView : UIView

@property (nonatomic, strong)UIColor *vColor; //btnView背景颜色
@property (nonatomic, strong)UIColor *BNBColor;  //按钮未选中背景颜色
@property (nonatomic, strong)UIColor *BSBColor;  //按钮选中背景颜色
@property (nonatomic, strong)UIColor *BNTColor;  //按钮未选中文字颜色
@property (nonatomic, strong)UIColor *BSTColor; //按钮选中文字颜色

-(void)setVBColor:(UIColor *)VBcolor BNBColor:(UIColor *)BNBColor BSBColor:(UIColor *)BSBColor BNTColor:(UIColor *)BNTColor BSTColor:(UIColor *)BSTColor;


-(void)setSC:(UIView *)sc arr:(NSArray *)arr vc:(UIViewController *)vc action:(SEL)action Alignment:(NSInteger)Alignment selectIndex:(NSInteger)selectIndex space:(CGFloat)space;

//-(void)setView:(UIView *)sc arr:(NSArray *)arr vc:(UIViewController *)vc action:(SEL)action Alignment:(NSInteger)Alignment selectIndex:(NSInteger)selectIndex space:(CGFloat)space;
@end
