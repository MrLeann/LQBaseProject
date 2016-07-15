//
//  GuideUIView.m
//  xinbotv
//
//  Created by YZR on 16/4/21.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "GuideUIView.h"

//引导页张数
#define DEF_GUIDE_COUNT 3

@interface GuideUIView ()<UIScrollViewDelegate>{

    NSInteger customCurrentPage;//目前页码
    UIPageControl *pageControl;//pageCtl
    
    UIScrollView *_scrollView;//
    
}

@end

@implementation GuideUIView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       self.backgroundColor = [UIColor whiteColor];
    
        /**    scrollView相关    **/
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.bounces= NO;//必须为NO，后面可以看到
        _scrollView.frame = CGRectMake(0, 0, kWindowWidth, kWindowHeight);
        _scrollView.contentSize = CGSizeMake(self.frame.size.width * DEF_GUIDE_COUNT, kWindowHeight);
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES; //单页显示
        _scrollView.delegate=self;
        _scrollView.userInteractionEnabled = YES;
        
        for (int i=1; i<= DEF_GUIDE_COUNT; i++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWindowWidth*(i-1), 0, kWindowWidth,kWindowHeight)];
            
            [imageView setBackgroundColor:[UIColor lightGrayColor]];
            
            
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"guidepage_%d",i]]];
            
//            NSLog(@"输出图片 = %@",[NSString stringWithFormat:@"Guide%d.jpg",i]);
            //4s屏幕
            if ([UIScreen mainScreen].bounds.size.height == 480) {
                [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"guidepage_%d",i]]];
            }
            [_scrollView addSubview:imageView];
            
            if (i==3) {
                
                //最后一张的情况
                UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(80,kWindowHeight - 49 - 40, kWindowWidth - 160, 40);
                //设置边框
                [button.layer setMasksToBounds:YES];
                [button.layer setBorderColor:[UIColor whiteColor].CGColor];
                [button.layer setBorderWidth:1];
                [button.layer setCornerRadius:5];
//                button.alpha = 0.8;
                [button setTitle:@"立即体验" forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:20];
                
                [button addTarget:self action:@selector(beginClick) forControlEvents:UIControlEventTouchUpInside];
                imageView.userInteractionEnabled = YES;
                [imageView addSubview:button];
            }
        }
        
        [self addSubview:_scrollView];
        
        //****** 添加pageController *******
        pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, kWindowHeight - 40, kWindowWidth, 30)];
        //设置最大个数
        pageControl.numberOfPages=DEF_GUIDE_COUNT;
        pageControl.backgroundColor = [UIColor clearColor];
        //设置每一个点的颜色
        pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.0];
        //设置选中点的颜色
        pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
        //设置初始的选项, 从 0 ... 开始
        pageControl.currentPage = 0;
        [self addSubview:pageControl];
  
    }
    return self;
}

//只要有滚动， 就会条用这个函数(这里不写，也可以实现)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    customCurrentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    //修改currentPage
    pageControl.currentPage = customCurrentPage;
//    NSLog(@"输出滑动了 = %f",scrollView.contentOffset.x);
    //3张就写2啊！！！
    CGFloat myX = kWindowWidth *2 + 50;
//    NSLog(@"输出屏幕宽 = %f,移动距离 = %f",kWindowWidth,myX);
    if (scrollView.contentOffset.x > myX) {
        
        self.userInteractionEnabled = NO;
        [UIView animateWithDuration:1 animations:^{
            //缩放动画
            self.transform = CGAffineTransformMakeScale(2.0, 2.0);
            
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

#pragma mark - 点击进入主页
- (void)beginClick
{
    self.userInteractionEnabled = NO;
    [UIView animateWithDuration:1 animations:^{
        //缩放动画
        self.transform = CGAffineTransformMakeScale(2.0, 2.0);
        
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



@end
