//
//  TwoDimensionCodeViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "TwoDimensionCodeViewController.h"
#import "TwoDimensionCodeOriginVC.h"//原生
#import "LXDTwoDimensionCodeVC.h"//LXD
#import "HomeScanViewController.h"//自定义扫描


@interface TwoDimensionCodeViewController ()


@end

@implementation TwoDimensionCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 按钮点击
- (IBAction)mBtnClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100:{
            TwoDimensionCodeOriginVC *vc1 = [TwoDimensionCodeOriginVC new];
            [self.navigationController pushViewController:vc1 animated:YES];
            
        }
            break;
            
        case 101:{
            LXDTwoDimensionCodeVC *vc2 = [LXDTwoDimensionCodeVC new];
            [self.navigationController pushViewController:vc2 animated:YES];
        }
            break;
            
        case 102:{
            HomeScanViewController *vc = [HomeScanViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}




@end
