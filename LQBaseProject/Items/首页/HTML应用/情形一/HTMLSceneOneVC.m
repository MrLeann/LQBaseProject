//  HTMLSceneOneVC.m
//  LQBaseProject
//  Created by YZR on 16/11/21.
//  Copyright © 2016年 YZR. All rights reserved.

#import "HTMLSceneOneVC.h"

@interface HTMLSceneOneVC ()<UIWebViewDelegate>{

}

//UIWebView
@property (weak, nonatomic) IBOutlet UIWebView *vWebView;

@end

@implementation HTMLSceneOneVC

-(void)viewDidLoad{
    [super viewDidLoad];

    [self mInitData];
}

#pragma mark -
-(void)mInitData{
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"myhtml" ofType:@"html"];
    
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.vWebView loadHTMLString:htmlCont baseURL:baseURL];
    
    
//    文／青楼（简书作者）
//    原文链接：http://www.jianshu.com/p/c375ac056149
//    著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
    
}



@end
