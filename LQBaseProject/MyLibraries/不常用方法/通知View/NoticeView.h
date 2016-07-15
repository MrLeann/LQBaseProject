//
//  NoticeView.h
//  公告滚动View
//
//  Created by yzr on 16/6/6.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+TextSpace.h"


@interface NoticeView : UIView
@property (nonatomic, strong)UIScrollView *sc;
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, assign)CGFloat textWith;
@property (nonatomic, assign)NSInteger  timeIndex;


-(instancetype)setFrame:(CGRect)rect text:(NSString *)text font:(NSInteger)font time:(NSInteger)time;
+ (instancetype)shareInstance;
@end
