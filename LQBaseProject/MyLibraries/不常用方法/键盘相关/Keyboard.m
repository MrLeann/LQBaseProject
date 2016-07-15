//
//  Keyboard.m
//  virtualdeal
//
//  Created by yzr on 16/6/20.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "Keyboard.h"

@implementation Keyboard

+(void)addKeyNotify:(UIViewController *)vc show:(SEL)show hide:(SEL)hide
{
    //监听键盘状态-显示
    [[NSNotificationCenter defaultCenter] addObserver:vc selector:show name:UIKeyboardWillShowNotification object:nil];
    //监听键盘状态-隐藏
    [[NSNotificationCenter defaultCenter] addObserver:vc selector:hide name:UIKeyboardWillHideNotification object:nil];
}


+(CGFloat)isHeight:(UIViewController *)vc notify:(NSNotification *)notification
{
        NSValue* aValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardRect = [aValue CGRectValue];
        CGRect keyboardFrame = [vc.view convertRect:keyboardRect fromView:[[UIApplication sharedApplication] keyWindow]];
        CGFloat keyboardHeight = keyboardFrame.size.height;
//        NSLog(@"##keboardHeight=%.2f",keyboardHeight);
    
    return keyboardHeight;
}

//+(void)animated:
//{
//    [UIView animateWithDuration:0.3 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//
//}


@end
