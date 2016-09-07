//
//  LQTabBarController.m
//  LQWeiXin
//
//  Created by YZR on 16/6/25.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LQTabBarController.h"
#import "LQNavigationController.h"
#import "FisrtViewController.h"//主页
#import "SecondViewController.h"//交易
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface LQTabBarController ()<UITabBarControllerDelegate>

@end

@implementation LQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mLoadDefaultSetting];
    
}

//初始化TabBar
-(void)mLoadDefaultSetting{

    //
    NSArray *normalImgArr = [[NSArray alloc] initWithObjects:@"home1",@"red_noneselect",@"trade_noneselect",@"my_noneselect", nil];
    NSArray *selectImgArr = [[NSArray alloc] initWithObjects:@"home_select",@"red_select",@"trade_select",@"my_select", nil];
    NSArray *titleArr = [[NSArray alloc] initWithObjects:@"主页",@"富文本",@"动画",@"音乐", nil];
    NSArray *classNameArr = [[NSArray alloc] initWithObjects:@"FisrtViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController", nil];
    
    NSMutableArray *viewControllersArray = [[NSMutableArray alloc] init];
    
    int i = 0;
    
    //循环初始化控制器
    for (NSString *className in classNameArr) {
        
        UIViewController *rtVC = [[NSClassFromString(className) alloc] init];
        LQNavigationController *nav = [[LQNavigationController alloc] initWithRootViewController:rtVC];
//        nav.navigationItem.title = titleArr[i];
        nav.tabBarItem.title = titleArr[i];
        
        nav.tabBarItem.image = [[UIImage imageNamed:normalImgArr[i]] mOriginalImage];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImgArr[i]] mOriginalImage];
        
        //设置tabBar的整个背景颜色
        self.tabBar.barTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
      
        //设置选中按钮的颜色
        self.tabBar.tintColor = [UIColor lightGrayColor];
        
        [viewControllersArray addObject:nav];
        
        i++;
    }
    self.viewControllers = viewControllersArray;
    
    // tabBar相关属性的设置
    self.tabBar.translucent = NO;
}

@end
