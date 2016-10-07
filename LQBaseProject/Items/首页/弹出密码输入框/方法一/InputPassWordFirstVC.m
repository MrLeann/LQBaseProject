//
//  InputPassWordFirstVC.m
//  LQBaseProject
//
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "InputPassWordFirstVC.h"

@interface InputPassWordFirstVC ()

@end

@implementation InputPassWordFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 蒙版添加到此View 的输入框
- (IBAction)mClick:(UIButton *)sender {
    
    //创建蒙版（创建动画效果要2层View，最底部View设为透明，蒙版View放在上面）
    //输入框View也是添加到最底层上面，这样设置动画的时候，输入框View可以不受蒙版View的消失的影响
    UIView *maskViw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    maskViw.backgroundColor = [UIColor clearColor];
    maskViw.tag = 777;
    [self.view addSubview:maskViw];
    
    //半透明黑色层
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.5;
    
    //开启手势
    backView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mBackViewTapClick:)];
    [backView addGestureRecognizer:tap1];
    [maskViw addSubview:backView];
    
    //整个输入框
    UIView *inputView = [[UIView alloc]initWithFrame:CGRectMake(30, kWindowHeight, [UIScreen mainScreen].bounds.size.width - 2 *30, 150)];
    inputView.backgroundColor = RGBColor(250, 250 ,250);
    [inputView setAllCorner:5.0];
    [maskViw addSubview:inputView];
    
    //顶部的标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, inputView.width, 40)];
    titleLabel.backgroundColor = [UIColor blackColor];
    titleLabel.text = @"请输入密码";
    titleLabel.font = [UIFont systemFontOfSize:15.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel setTopCorner:5.0];//设置顶部的圆角值】
    [inputView addSubview:titleLabel];
    
    //输入矩形框
    CGFloat aViewX = 20;
    CGFloat aViewH = (inputView.width - 40)/6;
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(20, (inputView.height - titleLabel.height - 45)/2 + titleLabel.height - 5, inputView.width - 40, 50)];
    [aView.layer setBorderColor:RGBColor(158, 158, 158).CGColor];
    [aView.layer setBorderWidth:1.0];//边框
    [aView.layer setMasksToBounds:YES];
    aView.layer.cornerRadius = 5.0;//切圆
    [inputView addSubview:aView];
    
    //添加5个分割线
    for (NSInteger i = 0; i < 5; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(aViewX + aViewH * (i+1), aView.y + 5 , 1, aViewH - 4)];
        line.backgroundColor = RGBColor(222, 222, 222);
        [inputView addSubview:line];
    }
    
    //创建6个密码输入点，UILabel对象
    CGFloat yuanW = 14;
    CGFloat yuanX = (aViewH - yuanW)/2;
    CGFloat yuanY = (aView.y + (aViewH - yuanW)/2);
    for (NSInteger i = 0; i < 6; i++) {
        
        UILabel *yuan = [[UILabel alloc]initWithFrame:CGRectMake(aViewX + aViewH * i + yuanX, yuanY + 3, yuanW, yuanW)];
        
//        yuan.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
//        yuan.backgroundColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0];
        
        yuan.backgroundColor = [UIColor blackColor];
        
        yuan.tag = 30000 + i;
        [yuan setAllCorner:yuanW/2];
        yuan.hidden = YES;
        [inputView addSubview:yuan];
    }
    
    //输入框，弹起键盘，隐藏的
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(0, -50, 1, 1)];
    tf.tintColor = [UIColor clearColor];
    tf.keyboardType = UIKeyboardTypeNumberPad;
    tf.textColor = [UIColor clearColor];
    tf.secureTextEntry = YES; //密码样式
    
    [tf addTarget:self action:@selector(payTfChanged:) forControlEvents:UIControlEventEditingChanged];
    [tf becomeFirstResponder];
    [inputView addSubview:tf];
    
    //动画上移
    [UIView animateWithDuration:0.3 animations:^{
        inputView.frame = CGRectMake(30, 200, [UIScreen mainScreen].bounds.size.width - 2 *30, 150);
        //[self.view layoutIfNeeded];//约束动画
    }];
}

#pragma mark - 手势点击
-(void)mBackViewTapClick:(UITapGestureRecognizer *)tap{
  
    [self.view endEditing:YES];
    for(id obj in self.view.subviews){
        UIView *viewT = (UIView *)obj;
        if (viewT.tag == 777){
            
            //移除蒙版View的底部Viwe
            [viewT removeFromSuperview];
        }
    }
}

#pragma mark -
-(void)payTfChanged:(UITextField *)sender{
    
    if (sender.text.length == 7) {
        sender.text = [sender.text substringToIndex:6];
    }
    
    UIView *v = sender.superview;
    for (id obj in v.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)obj;
            if (label.tag >= 30000){
                
                if (label.tag >= sender.text.length + 30000) {
                    label.hidden = YES;
                
                }else{
                    label.hidden = NO;
                }
            }
        }
    }
}

@end





