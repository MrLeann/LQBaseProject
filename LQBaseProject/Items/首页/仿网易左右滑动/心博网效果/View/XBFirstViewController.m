//
//  XBFirstViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/10/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "XBFirstViewController.h"

@interface XBFirstViewController ()

@end

@implementation XBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitUI];


}

-(void)mInitUI{
    self.view.backgroundColor = kRandomColor;//随机颜色
    
//    self.view.backgroundColor = [UIColor redColor];
}

@end
