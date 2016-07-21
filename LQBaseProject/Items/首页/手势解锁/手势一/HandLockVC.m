//
//  HandLockVC.m
//  GCBWallet
//
//  Created by yzr on 16/7/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "HandLockVC.h"
#import "LockView.h"

@interface HandLockVC ()

@end

@implementation HandLockVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor =[UIColor colorWithRed:145/255.0 green:213/255.0 blue:246/255.0 alpha:1.0];
    
    
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kWindowWidth, kWindowHeight)];
    [imageV setImage:[UIImage imageNamed:@"back"]];
    [self.view addSubview:imageV];
    
    LockView * view=[[LockView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height/4,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    view.LineBack=^(NSString * str){
        
        [self.view toastShow:str];
        NSLog(@"%@",str);
    };
    
    [self.view addSubview:view];
}



- (IBAction)backClick:(UIButton *)sender {

      [self dismissViewControllerAnimated:YES completion:nil];
}



@end
