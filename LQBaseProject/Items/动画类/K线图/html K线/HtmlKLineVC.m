//
//  HtmlKLineVC.m
//  LQBaseProject
//
//  Created by YZR on 16/8/13.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "HtmlKLineVC.h"
#import <JavaScriptCore/JavaScriptCore.h>//JS头文件


@interface HtmlKLineVC ()<UIWebViewDelegate>{
    
    
}

//web 对象
@property (weak, nonatomic) IBOutlet UIWebView *vWebView;


@end

@implementation HtmlKLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.vWebView.delegate = self;
    
    [self mInitHtml];
}

//
-(void)mInitHtml{
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"chart"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.vWebView loadHTMLString:htmlCont baseURL:baseURL];
    


}

#pragma mark -  网页加载完成后
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
    NSString *bj =@"[[1, -9], [2, 1], [3, 12], [4, 20],[5, 26], [6, 30], [7, 32], [8, 29],[9, 22], [10, 12], [11, 0], [12, -6]]";// First data series
    
    NSString *sz = @"[[1, 15], [2, 16], [3, 19], [4, 22],[5, 26], [6, 27], [7, 28], [8, 28],[9, 27], [10, 25], [11, 20], [12, 16]]";
    
    JSContext *context = [self.vWebView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //根据HTML的方法名
    context[@"setContentInfo"] = ^(JSContext *context, JSValue *exceptionValue) { //播放背景音乐
        
        NSLog(@"输出----");
        
    };

    
    
}


@end
