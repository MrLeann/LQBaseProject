//
//  LitBtnView.m
//  任意位置的下拉View
//
//  Created by yzr on 16/7/30.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "LitBtnView.h"
#import "MyLibraries.h"

@implementation LitBtnView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}


-(void)setVBColor:(UIColor *)VBcolor BNBColor:(UIColor *)BNBColor BSBColor:(UIColor *)BSBColor BNTColor:(UIColor *)BNTColor BSTColor:(UIColor *)BSTColor
{
    self.vColor = VBcolor;
    self.BNBColor = BNBColor;
    self.BSBColor = BSBColor;
    self.BNTColor = BNTColor;
    self.BSTColor = BSTColor;
}


-(void)setSC:(UIView *)sc arr:(NSArray *)arr vc:(UIViewController *)vc action:(SEL)action Alignment:(NSInteger)Alignment selectIndex:(NSInteger)selectIndex space:(CGFloat)space
{
    CGFloat btnH = self.frame.size.height/arr.count;
    
//    [self setAllCorner:2.0];
    self.backgroundColor = self.vColor;
    self.tag = 20000;
    
    for (NSInteger i = 0; i < arr.count; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0.5 ,  i * btnH , self.width-1, btnH -0.5 )];
        btn.tag = 10000 + i;
        [btn isTitleColor:self.BNTColor selectColor:self.BSTColor title:arr[i] font:14 Target:self Action:@selector(btnAction:) backColor:self.BNBColor];
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
        
//        if (i == 0) {
//            [btn setTopCorner:5];
//        }else if (i == arr.count - 1){
//            [btn setBottomCorner:5];
//        }
    }
    
    [sc addSubview:self];
    self.hidden = YES;
}

-(void)btnAction:(UIButton *)sender
{
    sender.selected = YES;
    sender.backgroundColor = self.BSBColor;
    for (UIButton *btn in [ForInView supView:self]) {
        if (btn.tag >= 10000 && btn != sender) {
            btn.selected = NO;
            btn.backgroundColor = self.BNBColor;
        }
    }
            [dispatch_do delayTime:0.2 doSome:^(id doSome) { //dispatch延迟
                [Animation setHideView:self time:0.2];
            }];
}




@end
