//
//  NoticeView.m
//  公告滚动View
//
//  Created by yzr on 16/6/6.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "NoticeView.h"
#import "AdaptText.h"
#import "MyLibraries.h"

@interface NoticeView()

@end

@implementation NoticeView

// 单例的实现
+ (instancetype)shareInstance
{
    static NoticeView *manager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[NoticeView alloc] init];
    });
    
    return manager;
}

-(instancetype)setFrame:(CGRect)rect text:(NSString *)text font:(NSInteger)font time:(NSInteger)time
{
    NoticeView *nView = [NoticeView shareInstance];
    nView.frame = rect;
    
    self.sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    self.sc.scrollEnabled = NO;
    self.label = [[UILabel alloc]init];;
    self.label.font = [UIFont boldSystemFontOfSize:font];
    self.label.text = text;
    self.textWith =  [AdaptText setWith:self.label.text forFont:font];
    self.label.frame = CGRectMake(kWidth, 0, self.textWith, rect.size.height);
    self.label.textColor = [UIColor whiteColor];
    
    [self.sc addSubview:self.label];
    [nView addSubview:self.sc];
    
    self.timeIndex = time;
   
    //延迟加载
    [self performSelector:@selector(delayClick) withObject:nil afterDelay:0.5];

    
    return nView;
}
-(void)delayClick
{
    [UIView animateWithDuration:self.timeIndex animations:^{
        self.sc.contentOffset = CGPointMake(kWidth  + self.textWith, 0);
    }];
    //延迟加载
    [self performSelector:@selector(delayLoad1) withObject:nil afterDelay:self.timeIndex];
}

-(void)delayLoad1
{
    self.sc.contentOffset = CGPointMake(0, 0);
    
    [self delayClick];
}
@end

