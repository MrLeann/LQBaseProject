//
//  UIButton+Btn.m
//  按钮封装
//
//  Created by yzr on 16/5/23.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "UIButton+Btn.h"
#import "MyLibraries.h"

@implementation UIButton (Btn)
-(instancetype)isTitleColor:(UIColor *)color selectColor:(UIColor *)selectColor title:(NSString *)title font:(CGFloat)font Target:(id)target Action:(SEL)action backColor:(UIColor *)backColor
{
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitleColor:selectColor forState:UIControlStateSelected];
    
        self.backgroundColor =  backColor;
 
        self.titleLabel.font = [UIFont systemFontOfSize:font];
    
        [self setTitle:[NSString stringWithFormat:@"%@",title] forState:UIControlStateNormal];
        
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;
}

-(void)setBorder:(UIColor *)color width:(CGFloat)width
{
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
    [self.layer setMasksToBounds:YES];
}

-(void)setVerticalImageY:(CGFloat)imageY textY:(CGFloat)textY
{
    CGFloat textW = [AdaptText setWith:self.titleLabel.text font:self.titleLabel.font];
    CGFloat imageH = self.imageView.image.size.height;
    CGFloat imageW = self.imageView.image.size.width;
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    self.imageEdgeInsets = UIEdgeInsetsMake((self.height - imageH - 30)/2 + imageY,(self.width - imageW)/2, 0, 0);
    self.titleEdgeInsets =  UIEdgeInsetsMake(self.height + textY - 30,(self.width - textW)/2 - imageW , 0, 0);
    
}

-(void)setVerticalImageX:(CGFloat)imageX imageY:(CGFloat)imageY textX:(CGFloat)textX textY:(CGFloat)textY
{
    CGFloat textW = [AdaptText setWith:self.titleLabel.text font:self.titleLabel.font];
    CGFloat imageH = self.imageView.image.size.height;
    CGFloat imageW = self.imageView.image.size.width;
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    self.imageEdgeInsets = UIEdgeInsetsMake((self.height - imageH - 30)/2 + imageY,(self.width - imageW)/2 + imageX, 0, 0);
    self.titleEdgeInsets =  UIEdgeInsetsMake(self.height - 30  + textY,(self.width - textW)/2 - imageW + textX, 0, 0);
    
}


-(void)setHighlight
{
    [self addTarget:self action:@selector(highlight) forControlEvents:UIControlEventTouchUpInside];
}

-(void)highlight
{
    self.titleLabel.alpha = 0.5;
    //延迟加载
    [self performSelector:@selector(delayLoad) withObject:nil afterDelay:0.15];
}

-(void)delayLoad
{
    self.titleLabel.alpha = 1.0;
}


-(void)setLoadFont:(CGFloat)font
{
    CGFloat labelWidth = [self setWith:self.titleLabel.text forFont:font];
    CGFloat imageWith = self.imageView.frame.size.width;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + 5, 0, -labelWidth);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith - 5, 0, imageWith);
    
}
#pragma mark - 自适应宽度
-(CGFloat)setWith:(NSString *)string forFont:(NSInteger)fontIndex
{
    CGRect titleRect = [string boundingRectWithSize:CGSizeMake(10000, fontIndex + 10) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontIndex]} context:nil];
    
    return titleRect.size.width;
}



@end
