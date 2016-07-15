//
//  HeaderSC.m
//  SpotOption
//
//  Created by yzr on 16/7/5.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "HeaderSC.h"
#import "MyLibraries.h"
//#import "Singleton.h"

@implementation HeaderSC

//+(void)setFrame:(CGRect)rect btnIndex:(NSInteger)btnIndex textArr:(NSArray *)textArr textColor:(UIColor *)textColor  selectColor:(UIColor *)selectColor font:(NSInteger)font contentSize:(CGSize)contentSize  vc:(UIViewController *)vc action:(SEL)action
//{
//    UIView *v = [[UIView alloc]initWithFrame:rect]; //背景View
//    v.backgroundColor = [Singleton shared].btnBackColor;
//    [vc.view addSubview:v];
//    
//    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:rect]; //sc
//    sc.contentSize = contentSize;
//    sc.showsHorizontalScrollIndicator = NO;
//    sc.showsVerticalScrollIndicator = NO;
//    sc.tag = 111111;
//    [vc.view addSubview:sc];
//    
//    CGFloat width = sc.width;
//    
//    for (NSInteger i = 0; i < textArr.count; i++) { //按钮
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*width/btnIndex, 0, width/btnIndex, sc.height)];
//        btn.tag = 10 + i;
//        [btn isTitleColor:textColor selectColor:selectColor title:[MyStr str:textArr[i]] font:font Target:vc Action:action backColor:[Singleton shared].btnBackColor];
//    
//        if (i == 0) btn.selected = YES;
//        [btn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
//        [sc addSubview:btn];
//        
//    }
//    
//    for (NSInteger i = 0; i < textArr.count; i++) { //分割线label
//        
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((i+1)*width/btnIndex,(sc.height - font)/2, 1, font)];
//        [label isText:@"" textColor:nil font:15 textAlignment:1 backColor:RGBColor(41, 41, 41)];
//        [sc addSubview:label];
//        
//    }
//    
//    
//}
//
//+(void)changeColor:(UIButton *)sender
//{
//    sender.selected = YES;
//    UIScrollView *sc = (UIScrollView *)sender.superview;
//    for (id obj in sc.subviews)  {  //遍历View
//        if ([obj isKindOfClass:[UIButton class]]) {
//            UIButton* theButton = (UIButton*)obj;
//            if (theButton != sender) {
//                theButton.selected = NO;
//            }
//           
//        }
//    }
//    
//    
//}

@end
