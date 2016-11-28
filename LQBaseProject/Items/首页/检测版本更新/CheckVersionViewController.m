//  CheckVersionViewController.m
//  LQBaseProject
//  Created by YZR on 16/11/23.
//  Copyright © 2016年 YZR. All rights reserved.

/*
 *   汇新云的AppId 为：1159561412
 */

#import "CheckVersionViewController.h"

#define STOREAPPID @"1159561412"

@interface CheckVersionViewController ()

@end

@implementation CheckVersionViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 检测更新
- (IBAction)mCheckUpdateClick:(UIButton *)sender{

    
    [self upDateVersionClick];
}

/**
 *   版本检测出
 */
-(void)upDateVersionClick{

    // 1、先获取当前工程项目版本号
    NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
    NSLog(@"%@",infoDic);
    
    NSString *currentVersion=infoDic[@"CFBundleShortVersionString"];
    
    //2、从网络获取appStore版本号
    NSError *error;
    NSData *response = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",STOREAPPID]]] returningResponse:nil error:nil];
    if (response == nil) {
        NSLog(@"你没有连接网络哦");
        return;
    }
    NSDictionary *appInfoDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"hsUpdateAppError:%@",error);
        return;
    }
    //    NSLog(@"%@",appInfoDic);
    NSArray *array = appInfoDic[@"results"];
    
    if (array.count < 1) {
        NSLog(@"此APPID为未上架的APP或者查询不到");
        return;
    }
    
    NSDictionary *dic = array[0];
    NSString *appStoreVersion = dic[@"version"];
    //打印版本号
    NSLog(@"当前版本号:%@\n商店版本号:%@",currentVersion,appStoreVersion);
    //设置版本号
    currentVersion = [currentVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    if (currentVersion.length==2) {
        currentVersion  = [currentVersion stringByAppendingString:@"0"];
    }else if (currentVersion.length==1){
        currentVersion  = [currentVersion stringByAppendingString:@"00"];
    }
    appStoreVersion = [appStoreVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    if (appStoreVersion.length==2) {
        appStoreVersion  = [appStoreVersion stringByAppendingString:@"0"];
    }else if (appStoreVersion.length==1){
        appStoreVersion  = [appStoreVersion stringByAppendingString:@"00"];
    }
    
    //4当前版本号小于商店版本号,就更新
    if([currentVersion floatValue] < [appStoreVersion floatValue])
    {
        
        UIAlertController *alercConteoller = [UIAlertController alertControllerWithTitle:@"版本有更新" message:[NSString stringWithFormat:@"检测到新版本(%@),是否更新?",dic[@"version"]] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
            //此处加入应用在app store的地址，方便用户去更新，一种实现方式如下
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8", STOREAPPID]];
            
            NSLog(@"输出打开的 Url地址 = %@",url);
            
            [[UIApplication sharedApplication] openURL:url];
        
        }];
        
        UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alercConteoller addAction:actionYes];
        [alercConteoller addAction:actionNo];
        [self presentViewController:alercConteoller animated:YES completion:nil];
        
    }else{
        
        NSLog(@"版本号好像比商店大噢!检测到不需要更新");
    }
    
}

@end
