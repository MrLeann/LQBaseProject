
//
//  UIButton+LQAdd.m
//  LQBaseProject
//
//  Created by YZR on 16/9/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "UIButton+LQAdd.h"

@implementation UIButton (LQAdd)


#pragma mark - 按钮属性一行设置
-(instancetype)mTitleColor:(UIColor *)color selectColor:(UIColor *)selectColor title:(NSString *)title font:(CGFloat)font Target:(id)target Action:(SEL)action backColor:(UIColor *)backColor{
    
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:selectColor forState:UIControlStateSelected];
    
    self.backgroundColor =  backColor;
    
    self.titleLabel.font = [UIFont systemFontOfSize:font];
    
    [self setTitle:[NSString stringWithFormat:@"%@",title] forState:UIControlStateNormal];
    
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;
}


#pragma mark - 设置边框(宽和颜色)
-(void)setBorder:(UIColor *)color width:(CGFloat)width{
    
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
    [self.layer setMasksToBounds:YES];
}

//#pragma mark - 设置图片在上、文字在下
//-(void)setVerticalImageY:(CGFloat)imageY textY:(CGFloat)textY{
//    
//    
//    CGFloat textW = [AdaptText setWith:self.titleLabel.text font:self.titleLabel.font];
//    CGFloat imageH = self.imageView.image.size.height;
//    CGFloat imageW = self.imageView.image.size.width;
//    
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
//    
//    self.imageEdgeInsets = UIEdgeInsetsMake((self.height - imageH - 30)/2 + imageY,(self.width - imageW)/2, 0, 0);
//    self.titleEdgeInsets =  UIEdgeInsetsMake(self.height + textY - 30,(self.width - textW)/2 - imageW , 0, 0);
//    
//}




@end
