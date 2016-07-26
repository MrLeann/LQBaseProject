//
//  ViewController.h
//  动画+height+
//
//  Created by yzr on 16/6/29.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveGraph : UIView
@property (nonatomic, assign) CGFloat progress;//一个介于0到1的数字，表示流量剩余情况，决定水面的高度百分比

//动画上升
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
