//  ReminderSceneOneVC.m
//  LQBaseProject
//  Created by YZR on 16/11/20.
//  Copyright © 2016年 YZR. All rights reserved.

#import "ReminderSceneOneVC.h"
#import "LeafNotification.h"


@interface ReminderSceneOneVC ()

@end

@implementation ReminderSceneOneVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitUI];
    
}

-(void)mInitUI{
    
}

#pragma mark - 按钮一点击
- (IBAction)mFirstButtonClick:(UIButton *)sender{
    
    /*
     *  传入了self，是添加到vc控制器上的，不是UIWindow哦。
     */
    [LeafNotification showInController:self withText:@"我是一个粉刷匠"];
    
}

#pragma mark - 按钮二点击
- (IBAction)mSecondButtonClick:(UIButton *)sender{
    [LeafNotification showInController:self withText:@"我是一个粉刷匠" type:LeafNotificationTypeSuccess];
}

@end