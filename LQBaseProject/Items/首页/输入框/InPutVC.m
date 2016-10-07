
//
//  InPutVC.m
//  LQBaseProject
//
//  Created by YZR on 16/9/9.
//  Copyright © 2016年 YZR. All rights reserved.

/*
 *  1.变化的输入框是一个UITextView
 *  2.这个输入控件是继承LQInputView
 *  3.
 */


#import "InPutVC.h"
#import "LQInputView.h"//导入此头文件即可实现

@interface InPutVC ()


//输入View距离底部距离的约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vInputViewBottomLayout;

//输入View的高度约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vInputViewHeightLayout;

//输入UITextView控件
@property (weak, nonatomic) IBOutlet LQInputView *inputView;


@end

@implementation InPutVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self mInitUI];
    
    
    

}

-(void)mInitUI{
  
    //监听键盘弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    //设置文本框占位文字
    _inputView.placeholder = @"吖了个峥";
    _inputView.placeholderColor = [UIColor redColor];
    
    // 监听文本框文字高度改变
    _inputView.yz_textHeightChangeBlock = ^(NSString *text,CGFloat textHeight){
        // 文本框文字高度改变会自动执行这个【block】，可以在这【修改底部View的高度】
        // 设置底部条的高度 = 文字高度 + textView距离上下间距约束
        // 为什么添加10 ？（10 = 底部View距离上（5）底部View距离下（5）间距总和）
        _vInputViewHeightLayout.constant = textHeight + 10;
    };
    
    // 设置文本框最大行数
    _inputView.maxNumberOfLines = 4;

}

//键盘弹出会调用
-(void)keyboardWillChangeFrame:(NSNotification *)note{
    
    //获取键盘frame
    CGRect endFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘弹出时长
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    //修改底部视图距离底部的间距
    _vInputViewBottomLayout.constant = endFrame.origin.y != screenH?endFrame.size.height:0;
    
    //约束动画
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



@end
