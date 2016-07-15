//
//  WebViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *vWebView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     //初始化Web
    [self mInitWebView];
    
}

#pragma mark - 加载网页
-(void)mInitWebView
{
    
    //  // 1.添加请求网址类
    //    NSURL * url = [NSURL URLWithString:kUrl];
    //    // 2.将网址转化成请求类
    //    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    //    // 3.加载请求
    //    [self.web loadRequest:request];
    
    [self load];
    // 1.设置网页自适应视图大小
    self.vWebView.scalesPageToFit = YES;
    // 2.检测网页上的敏感信息
    
    self.vWebView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    // 监测网页加载进度 需要遵循协议 设置代理
    self.vWebView.delegate = self;
    self.vWebView.scrollView.scrollEnabled = NO;
    
}

-(void)load
{
    [self.vWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    
}

@end
