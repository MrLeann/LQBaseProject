//
//  getData.h
//  LQBaseProject
//
//  Created by YZR on 16/8/12.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface getData : NSObject

@property (nonatomic,retain) NSMutableArray *data;
@property (nonatomic,retain) NSArray *dayDatas;
@property (nonatomic,retain) NSMutableArray *category;
@property (nonatomic,retain) NSString *lastTime;
@property (nonatomic,retain) UILabel *status;
@property (nonatomic,assign) BOOL isFinish;
@property (nonatomic,assign) CGFloat maxValue;
@property (nonatomic,assign) CGFloat minValue;
@property (nonatomic,assign) CGFloat volMaxValue;
@property (nonatomic,assign) CGFloat volMinValue;
@property (nonatomic,assign) NSInteger kCount;
@property (nonatomic,retain) NSString *req_type;


-(void)changeFSData:(NSArray*)lines;
-(void)changeRKData:(NSArray*)lines;


@end
