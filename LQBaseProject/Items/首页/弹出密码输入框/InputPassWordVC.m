//
//  InputPassWordVC.m
//  LQBaseProject
//
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "InputPassWordVC.h"
#import "InputPassWordFirstVC.h"//第一个VC


@interface InputPassWordVC ()

@end

@implementation InputPassWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
   

}


#pragma mark - 第一个按钮点击 (密码输入)
- (IBAction)mFirstBtnClick:(UIButton *)sender {
    
    InputPassWordFirstVC *vc = [InputPassWordFirstVC new];
    [self.navigationController pushViewController:vc animated:YES];

}






@end
