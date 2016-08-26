//
//  Animation.h
//  UIView动画
//
//  Created by yzr on 16/7/2.
//  Copyright © 2016年 tancan. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animation : NSObject

#pragma mark - 有些动画没写执行完调用方法，就需自己写个延迟加载调用、、  target 可为nil

#pragma mark - 虚幻动画View隐藏和显示
+(void)setHideView:(UIView *)view time:(CGFloat)time;  //虚幻动画隐藏View
+(void)setShowView:(UIView *)view time:(CGFloat)time;  //虚幻动画显示View

#pragma mark - 左上角最小化再最大化动画
+(void)setLeftHide:(UIView *)view time:(CGFloat)time; //左缩小隐藏
+(void)setRightShow:(UIView *)view time:(CGFloat)time; //右放大显示

#pragma mark -  弹簧动画移动  0.0~1.0  越小越猛
//     [Animation setTanView:imageV time:2 tan:0.2 centerX:imageV.center.x + 200 centerY:imageV.center.y];
+(void)setTanView:(UIView *)view time:(CGFloat)time tan:(CGFloat)tan centerX:(CGFloat)centerX centerY:(CGFloat)centerY;


#pragma mark -  搓牌揭示动画 - 可实现替换图片动画   执行到四分之一时间调用方法
//    [Animation setRevealView:imageV time:1.0 type_0_3:0 vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+(void)setRevealView:(UIView *)view  time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target;


#pragma mark -  180°翻转动画   上下左右  旋转到90°调用方法(一半)
//    [Animation setFlipView:imageV time:2.0 type_0_3:0 vc:self target:@selector(hide)];
//    -(void)hide{imageV.hidden = YES;}
+ (void)setFlipView:(UIView *)view  time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target;

#pragma mark -  push 挤开动画  同时调用方法
//  [Animation setPushView:imageV time:1.0 type_0_3:2 vc:self target:@selector(changeImage)];
//  -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+(void)setPushView:(UIView *)view time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target;

#pragma mark -  present 移动覆盖动画  同时调用方法
//   [Animation setPresentView:imageV time:1.5 type_0_3:0 vc:self target:@selector(show)];
//   -(void)show{imageV.hidden = NO;}
+ (void)setPresentView:(UIView *)view time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target;


#pragma mark -  向右旋转45°缩小,然后再放大显示动画.   缩小到最小时候调用方法(一半)
//   [Animation setBlowView:imageV time:2.0 vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+(void)setBlowView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target;


#pragma mark -  旋转缩小再旋转放大动画     缩小到最小时候调用方法(一半)
//    [Animation setSpinView:imageV time:1.0 vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+ (void)setSpinView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target;

#pragma mark - 立体翻转动画 上下左右  同时调用方法
//    [Animation setCubeView:imageV time:1.5 type_0_3:1 vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+ (void)setCubeView:(UIView *)view time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target;


#pragma mark - 手动翻页动画  只写2种，往下翻 + 往回翻  同时调用方法
//   [Animation setPageView:imageV time:3 isNext:YES vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+ (void)setPageView:(UIView *)view  time:(CGFloat)time isNext:(BOOL)isNext vc:(UIViewController *)vc target:(SEL)target;


#pragma mark - 按水动画    执行到四分之一时间调用方法  
//   [Animation setWaterView:imageV time:2.0 vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+ (void)setWaterView:(UIView *)view  time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target;


#pragma mark - 撕书丢动画   同时调用方法
//    [Animation setDitchView:imageV time:1.5 vc:self target:@selector(hide)];
//    -(void)hide{imageV.hidden = YES;}
+ (void)setDitchView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target;


#pragma mark - 相机咔擦动画  开 + 关 
//    [Animation setWatchView:imageV time:0.5 isOpen:NO vc:self target:@selector(changeImage)];
//    -(void)changeImage{[imageV setImage:[UIImage imageNamed:@"1"]];}
+ (void)setWatchView:(UIView *)view time:(CGFloat)time isOpen:(BOOL)isOpen vc:(UIViewController *)vc target:(SEL)target;


#pragma mark - 左上角最小化再最大化动画
+(void)setLeastView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target;




//下拉显示
+ (void)setOpenView:(UIView *)view time:(CGFloat)time height:(CGFloat)height;
//上拉隐藏
+ (void)setCloseView:(UIView *)view time:(CGFloat)time height:(CGFloat)height;






@end
