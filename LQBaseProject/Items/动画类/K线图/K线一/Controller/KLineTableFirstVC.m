
//
//  KLineTableFirstVC.m
//  LQBaseProject
//
//  Created by YZR on 16/8/12.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "KLineTableFirstVC.h"
#import "lines.h"
#import "getData.h"
#import "RKLineView.h"

@interface KLineTableFirstVC (){

    RKLineView *rkLine;

}


@property (weak, nonatomic) IBOutlet UIView *riKView;


@end

@implementation KLineTableFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self mInitData];
    
}

#pragma mark - 初始化数据
-(void)mInitData{


    rkLine = [[RKLineView alloc] init];
    
    CGRect myframe = self.view.frame;
    
    myframe.origin = CGPointMake(0, 120);
    myframe.size = CGSizeMake(310, 200);
    rkLine.frame = myframe;
    
//    rkLine.req_type = @"d";
//    rkLine.req_freq = @"601888.SS";
    
    rkLine.xWidth = 315;
    rkLine.yHeight = 219;
    rkLine.kLineWidth = 4;
    rkLine.kLinePadding = 1.25;
    
//    rkLine.riKArry = [dic objectForKey:@"rows"];
    
    [self.view addSubview:rkLine];
    [rkLine start]; // 线图运行
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
