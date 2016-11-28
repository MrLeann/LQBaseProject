//  KeyBoardViewController.m
//  LQBaseProject
//  Created by YZR on 16/11/24.
//  Copyright © 2016年 YZR. All rights reserved.

#import "KeyBoardViewController.h"
//#import "UIView+YSTextInputKeyboard.h"//把它注释也可以实现输入框上移

@interface KeyBoardViewController ()


@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField5;

@end

@implementation KeyBoardViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitKeyBoard];
    
}

-(void)mInitKeyBoard{
    
    //    //实现键盘的弹出和隐藏，基本不需要编写一句代码。
    //    //通过offset的设置可以设置某个输入框特殊偏移量。
    //    self.textField4.kbMoving.offset = 200;
    //
    //    //你也可以通过设置一个具体的移动的视图而不是默认的父视图
    //    self.textField4.kbMoving.kbMovingView = self.view;
    //
    //    self.textField5.kbMoving.offset = 0;
    
}

@end
