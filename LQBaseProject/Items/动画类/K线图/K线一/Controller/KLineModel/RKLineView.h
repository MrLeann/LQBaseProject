//
//  RKLineView.h
//  LQBaseProject
//
//  Created by YZR on 16/9/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^updateBlock)(id);

@interface RKLineView : UIView


@property (nonatomic,copy) updateBlock finishUpdateBlock; // 定义一个block回调 更新界面

@property (nonatomic,assign) CGFloat xWidth; // x轴宽度
@property (nonatomic,assign) CGFloat yHeight; // y轴高度
@property (nonatomic,assign) CGFloat bottomBoxHeight; // y轴高度
@property (nonatomic,assign) CGFloat kLineWidth; // k线的宽度 用来计算可存放K线实体的个数，也可以由此计算出起始日期和结束日期的时间段
@property (nonatomic,assign) CGFloat kLinePadding;
@property (nonatomic,assign) int kCount; // k线中实体的总数 通过 xWidth / kLineWidth 计算而来
@property (nonatomic,retain) UIFont *font;

@property (nonatomic,retain) NSMutableArray *data;
@property (nonatomic,retain) NSDate *startDate;
@property (nonatomic,retain) NSDate *endDate;

@property (nonatomic,retain) NSMutableArray *riKArry;//分时数据数组
@property (nonatomic,retain) NSString *jrkp;//今日开盘
@property (nonatomic,retain) NSString *zrsp;//昨日收盘

-(void)start;
-(void)update;


@end
