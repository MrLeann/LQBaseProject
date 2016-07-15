//
//  NavView.m
//  SpotOption
//
//  Created by yzr on 16/7/4.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "NavView.h"
#import "MyLibraries.h"
#import "UIImage+TCRendering.h"

#define kPopImage   @"arrowt_left"



@implementation NavView

 #pragma mark -  左返回图片+右图片
+(void)setPopTitle:(NSString *)title rightImage:(NSString *)rightImage rightAction:(SEL)rightAction vc:(UIViewController *)vc
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    navView.backgroundColor = RGBColor(14, 14, 14);
    [vc.view addSubview:navView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 20, 60, 44);
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0,-20,0,0);
    //    UIControlContentHorizontalAlignmentCenter
    
   [leftBtn setImage:[[UIImage imageNamed:kPopImage] originalImage]forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(kWidth - 60, 20, 60, 44);
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if (rightImage.length > 0){
        [rightBtn setImage:[[UIImage imageNamed:rightImage] originalImage]forState:UIControlStateNormal];
    }
    [rightBtn addTarget:vc action:rightAction forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, [UIScreen mainScreen].bounds.size.width - 200, 44)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    
    [navView addSubview:leftBtn];
    [navView addSubview:rightBtn];
    [navView addSubview:titleLabel];
}

#pragma mark -  只右图片
+(void)setOnlyRight:(NSString *)title rightImage:(NSString *)rightImage rightAction:(SEL)rightAction vc:(UIViewController *)vc
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    navView.backgroundColor = RGBColor(14, 14, 14);
    [vc.view addSubview:navView];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(kWidth - 60, 20, 60, 44);
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if (rightImage.length > 0){
        [rightBtn setImage:[[UIImage imageNamed:rightImage] originalImage]forState:UIControlStateNormal];
    }
    [rightBtn addTarget:vc action:rightAction forControlEvents:UIControlEventTouchUpInside];

    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, [UIScreen mainScreen].bounds.size.width - 200, 44)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    
    
    [navView addSubview:rightBtn];
    [navView addSubview:titleLabel];
}

#pragma mark -  只左图片
+(void)setOnlyLeft:(NSString *)title vc:(UIViewController *)vc;
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    navView.backgroundColor = RGBColor(14, 14, 14);
    [vc.view addSubview:navView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 20, 60, 44);
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0,-20,0,0);
    
    [leftBtn setImage:[[UIImage imageNamed:kPopImage] originalImage]forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, [UIScreen mainScreen].bounds.size.width - 200, 44)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    
    
    [navView addSubview:leftBtn];
    [navView addSubview:titleLabel];
    
}


#pragma mark - 全有，左非返回
+(void)setTitle:(NSString *)title leftImage:(NSString *)leftImage rightImage:(NSString *)rightImage rightTitle:(NSString *)rightTitle leftAction:(SEL)leftAction  rightAction:(SEL)rightAction vc:(UIViewController *)vc
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    navView.backgroundColor = RGBColor(14, 14, 14);
    [vc.view addSubview:navView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 20, 60, 44);
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0,-20,0,0);
    //    UIControlContentHorizontalAlignmentCenter
  if (leftImage.length > 0)  [leftBtn setImage:[[UIImage imageNamed:leftImage] originalImage]forState:UIControlStateNormal];
    [leftBtn addTarget:vc action:leftAction  forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(kWidth - 55 - rightTitle.length * 8 , 30, 40 + rightTitle.length * 8, 27);
    rightBtn.layer.cornerRadius = 8;//切圆
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [rightBtn setBorder:RGBColor(255, 255, 255) width:1];//按钮边框
    
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if (rightImage.length > 0){
        [rightBtn setImage:[[UIImage imageNamed:rightImage] originalImage]forState:UIControlStateNormal];
    }
    if (rightTitle.length > 0) {
        [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    }
    
    [rightBtn addTarget:vc action:rightAction forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, [UIScreen mainScreen].bounds.size.width - 200, 44)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    
    [navView addSubview:leftBtn];
    [navView addSubview:rightBtn];
    [navView addSubview:titleLabel];
}



#pragma mark -  通用pop
+(void)pop:(UIButton *)sender
{
    for (UIView* next = [sender superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            UIViewController *vc = (UIViewController*)nextResponder;
            [vc.navigationController popViewControllerAnimated:YES];
            
        }
    }
}



@end
