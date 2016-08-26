//
//  LitBtnSc.m
//  GCBWallet
//
//  Created by yzr on 16/8/18.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LitBtnSc.h"
#import "MyLibraries.h"

@interface LitBtnSc () <UIScrollViewDelegate>

@end

@implementation LitBtnSc

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


-(void)setScColor:(UIColor *)VBcolor btnBackColor:(UIColor *)BNBColor btnSelectBackColor:(UIColor *)BSBColor btnTextColor:(UIColor *)BNTColor btnSelectTextColor:(UIColor *)BSTColor lineColor:(UIColor *)lineColor
{
    self.vColor = VBcolor;
    self.BNBColor = BNBColor;
    self.BSBColor = BSBColor;
    self.BNTColor = BNTColor;
    self.BSTColor = BSTColor;
    self.lineColor = lineColor;
}


-(void)setView:(UIView *)view arr:(NSArray *)arr action:(SEL)action Alignment:(NSInteger)Alignment selectIndex:(NSInteger)selectIndex space:(CGFloat)space font:(CGFloat)font vc:(UIViewController *)vc delegateBtn:(UIButton *)delegateBtn isTap:(BOOL)isTap
{
    
    self.isEnabled = YES;
    self.bounces = NO;
    CGFloat sizeH = self.height/4 *arr.count;
    CGFloat btnH = self.height/4;
    if (arr.count <= 4) {
        self.frame = CGRectMake(self.x, self.y, self.width, self.height/4*arr.count);
        sizeH = self.height;
        btnH = self.height/arr.count;
    }
    
//    TCLog(@"%f",btnH);
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.contentSize = CGSizeMake(self.width, sizeH);
    self.backgroundColor = self.vColor;
    self.tag = 8888;
    
    self.delegate = self;
    
    //开启手势
    if (isTap == YES) {
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [view addGestureRecognizer:tap];
    }
    
    
    
    for (NSInteger i = 0; i < arr.count; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0.5 ,  i * btnH , self.width - 1, btnH -0.5 )];
        btn.tag = 20000 + i;
        [btn isTitleColor:self.BNTColor selectColor:self.BSTColor title:arr[i] font:font Target:self Action:@selector(btnAction:) backColor:self.BNBColor];
        [btn addTarget:vc action:action forControlEvents:UIControlEventTouchUpInside];
        if (Alignment == 1) {
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, space, 0, 0);
        }else if (Alignment == 3) {
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -space, 0, 0);
        }
        if (i%2 == 1) {
            //            [btn setBorder:self.vColor width:1];//按钮边框
        }
        
        [self addSubview:btn];
        if (i == selectIndex) {
            btn.selected = YES;
            btn.backgroundColor = self.BSBColor;
        }
    }
    
//    TCLog(@"%f",self.contentSize.height);
    CGFloat lineH =   self.height/self.contentSize.height * self.height;
    if (arr.count <= 4) lineH = self.height;
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(self.x + self.width - 5, self.y, 5, lineH)];
    line.backgroundColor = self.lineColor;
//    line.tag = 99999;
    
    
    [view addSubview:self];
    [view addSubview:line];
    
    line.hidden = YES;
    if (arr.count <= 4) {
        [line removeFromSuperview];
    }
    self.hidden = YES;
    
    self.myHeight = self.height;
    
    self.delegateBtn = delegateBtn;
    line.tag = self.delegateBtn.tag + 100;
    [self.delegateBtn addTarget:self action:@selector(delegateAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)delegateAction:(UIButton *)sender
{
    if (self.isEnabled == NO) return;  //禁用相关
    
    self.isEnabled = NO;
    [dispatch_do delayTime:0.2 doSome:^(id doSome) { //dispatch延迟
        self.isEnabled = YES;
    }];

    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        [self show];
    }else [self hide];
}

-(void)btnAction:(UIButton *)sender
{
    sender.selected = YES;
    sender.backgroundColor = self.BSBColor;
    for (UIButton *btn in [ForInView supView:self]) {
        if (btn.tag >= 20000 && btn != sender) {
            btn.selected = NO;
            btn.backgroundColor = self.BNBColor;
        }
    }
    [self.delegateBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
    self.delegateBtn.selected = NO;
    [self hide];
}

-(void)hide
{

    [Animation setCloseView:self time:0.2 height:0];
//    [Animation setHideView:self time:0.2];
    UIView *v = self.superview;
    [Animation setHideView:[ForInView setView:v tag:self.delegateBtn.tag + 100] time:0.05];
    self.delegateBtn.selected = NO;
//   .hidden = YES;
}
-(void)show
{
    self.frame = CGRectMake(self.x, self.y, self.width, 0);
   [Animation setOpenView:self time:0.2 height:self.myHeight];
//    self.hidden = NO;
    UIView *v = self.superview;
    [dispatch_do delayTime:0.2 doSome:^(id doSome) { //dispatch延迟
//       [ForInView setView:v tag:99999].hidden = NO;
        [Animation setShowView:[ForInView setView:v tag:self.delegateBtn.tag + 100] time:0.2];
    }];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y <= scrollView.contentSize.height - self.height) {
        UIView *v = scrollView.superview;
    
//            TCLog(@"%f",scrollView.contentOffset.y);
        UILabel *line = (UILabel *)[ForInView setView:v tag:self.delegateBtn.tag + 100];
        [UIView animateWithDuration:0.2 animations:^{
            line.frame =  CGRectMake(line.x, self.y + (self.height - line.height)/(self.contentSize.height - self.height) *self.contentOffset.y , line.width, line.height);
        }];

       
//            TCLog(@"lin = %f",line.y)   ;
        
    }
}


//手势事件
-(void)tap
{
    [self hide];

    self.delegateBtn.selected = NO;
}



@end
