//
//  RKLineView.m
//  LQBaseProject
//
//  Created by YZR on 16/8/12.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "RKLineView.h"
#import "lines.h"
#import "UIColor+helper.h"
#import "getData.h"
//#import "commond.h"

@interface RKLineView ()
{
    NSThread *thread;
    UIView *mainboxView; // k线图控件
    UIView *bottomBoxView; // 成交量
    getData *getdata;
    
    UIView *movelineone; // 手指按下后显示的两根白色十字线
    UIView *movelinetwo;
    
    UIView *xxView;//展现信息
    UILabel *riqLable;//日期
    UILabel *kpLable;//开盘
    UILabel *zgLable;//最高
    UILabel *zdLable;//最低
    UILabel *spLable;//收盘
    UILabel *cjlLable;//成交量
    UILabel *cjeLable;//成交额
    UILabel *zflLable;//涨幅
    
    UILabel *movelinetwoLable;
    
    NSMutableArray *pointArray; // k线所有坐标数组
    
    UILabel *startDateLab;
    UILabel *endDateLab;
    
    UILabel *volMaxValueLab; // 显示成交量最大值
    
    BOOL isUpdate;
    BOOL isUpdateFinish;
    
    NSMutableArray *lineArray ; // k线数组
    NSMutableArray *lineOldArray ; // k线数组
    UIPinchGestureRecognizer *pinchGesture;
    CGPoint touchViewPoint;
    BOOL isPinch;
    
    UILabel *MA5; // 5均线显示
    UILabel *MA10; // 10均线
    UILabel *MA20; // 20均线
    
    UILabel *jg1;//价格1
    UILabel *jg2;//价格2
    UILabel *jg3;//价格3
    UILabel *jg4;//价格4
    UILabel *jg5;//价格5
    
    UILabel *zfl1;//涨幅率1
    UILabel *zfl2;//涨幅率2
    UILabel *zfl3;//涨幅率3
    UILabel *zfl4;//涨幅率4
    UILabel *zfl5;//涨幅率5
    
    UILabel *shou1;//手1
    UILabel *shou2;//手2
    UILabel *shou3;//手3
}

@end

@implementation RKLineView

-(id)init{
    self = [super init];
    [self initSet];
    return self;
}

-(void)initSet
{
    
    self.font = [UIFont systemFontOfSize:8];
    isUpdate = NO;
    isUpdateFinish = YES;
    isPinch = NO;
    
    lineArray = [[NSMutableArray alloc] init];
    lineOldArray = [[NSMutableArray alloc] init];
    
    self.finishUpdateBlock = ^(id self){
        [self updateNib];//十字线显示的view
    };
}

#pragma mark 更新界面等信息
-(void)updateNib{
    //NSLog(@"block");
    if (movelineone==Nil) {
        movelineone = [[UIView alloc] initWithFrame:CGRectMake(0,0, 0.5,
                                                               bottomBoxView.frame.size.height+bottomBoxView.frame.origin.y)];
        movelineone.backgroundColor = [UIColor colorWithHexString:@"#333333" withAlpha:0.5];
        [mainboxView addSubview:movelineone];
        movelineone.hidden = YES;
    }
    if (movelinetwo==Nil) {
        movelinetwo = [[UIView alloc] initWithFrame:CGRectMake(0,0, mainboxView.frame.size.width,1)];
        movelinetwo.backgroundColor = [UIColor colorWithHexString:@"#333333" withAlpha:0.5];
        movelinetwo.hidden = YES;
        [mainboxView addSubview:movelinetwo];
    }
    if (xxView==Nil) {
        CGRect oneFrame = movelineone.frame;
        oneFrame.size = CGSizeMake(60, 73);
        xxView = [[UIView alloc] initWithFrame:oneFrame];
        xxView.backgroundColor = [UIColor colorWithHexString:@"#333333" withAlpha:1];
        xxView.hidden = YES;
        
        riqLable = [[UILabel alloc] initWithFrame:CGRectMake(2,1, 60,8)];
        riqLable.font = [UIFont systemFontOfSize:8];
        riqLable.textColor = [UIColor whiteColor];
        
        kpLable = [[UILabel alloc] initWithFrame:CGRectMake(2,10, 60,8)];
        kpLable.font = [UIFont systemFontOfSize:8];
        kpLable.textColor = [UIColor whiteColor];
        
        zgLable = [[UILabel alloc] initWithFrame:CGRectMake(2,19, 60,8)];
        zgLable.font = [UIFont systemFontOfSize:8];
        zgLable.textColor = [UIColor whiteColor];
        
        zdLable = [[UILabel alloc] initWithFrame:CGRectMake(2,28, 60,8)];
        zdLable.font = [UIFont systemFontOfSize:8];
        zdLable.textColor = [UIColor whiteColor];
        
        spLable = [[UILabel alloc] initWithFrame:CGRectMake(2,37, 60,8)];
        spLable.font = [UIFont systemFontOfSize:8];
        spLable.textColor = [UIColor whiteColor];
        
        cjlLable = [[UILabel alloc] initWithFrame:CGRectMake(2,46, 60,8)];
        cjlLable.font = [UIFont systemFontOfSize:8];
        cjlLable.textColor = [UIColor whiteColor];
        
        cjeLable = [[UILabel alloc] initWithFrame:CGRectMake(2,55, 60,8)];
        cjeLable.font = [UIFont systemFontOfSize:8];
        cjeLable.textColor = [UIColor whiteColor];
        
        zflLable = [[UILabel alloc] initWithFrame:CGRectMake(2,64, 60,8)];
        zflLable.font = [UIFont systemFontOfSize:8];
        zflLable.textColor = [UIColor whiteColor];
        
        [xxView addSubview:riqLable];
        [xxView addSubview:kpLable];
        [xxView addSubview:zgLable];
        [xxView addSubview:zdLable];
        [xxView addSubview:spLable];
        [xxView addSubview:cjlLable];
        [xxView addSubview:cjeLable];
        [xxView addSubview:zflLable];
        [mainboxView addSubview:xxView];
    }
    if (movelinetwoLable==Nil) {
        CGRect oneFrame = movelinetwo.frame;
        oneFrame.size = CGSizeMake(36, 12);
        movelinetwoLable = [[UILabel alloc] initWithFrame:oneFrame];
        movelinetwoLable.font = self.font;
        movelinetwoLable.layer.cornerRadius = 5;
        movelinetwoLable.backgroundColor = [UIColor colorWithHexString:@"#333333" withAlpha:1];
        movelinetwoLable.textColor = [UIColor whiteColor];
        movelinetwoLable.textAlignment = UITextAlignmentCenter;
        movelinetwoLable.hidden = YES;
        [mainboxView addSubview:movelinetwoLable];
    }
    
    movelineone.frame = CGRectMake(touchViewPoint.x,0, 0.5,
                                   bottomBoxView.frame.size.height+bottomBoxView.frame.origin.y);
    movelinetwo.frame = CGRectMake(0,touchViewPoint.y, mainboxView.frame.size.width,0.5);
    CGRect oneFrame = movelineone.frame;
    oneFrame.size = CGSizeMake(60, 73);
    xxView.frame = oneFrame;
    CGRect towFrame = movelinetwo.frame;
    towFrame.size = CGSizeMake(36, 12);
    movelinetwoLable.frame = towFrame;
    
    movelineone.hidden = NO;
    movelinetwo.hidden = NO;
    xxView.hidden = NO;
    movelinetwoLable.hidden = NO;
    [self isKPointWithPoint:touchViewPoint];//一点击就显示十字状态
}

-(void)start{
    [self drawBox];
    thread = [[NSThread alloc] initWithTarget:self selector:@selector(drawLine) object:nil];
    [thread start];
}

#pragma mark 画框框和平均线
-(void)drawBox{
    // 画个k线图的框框
    if (mainboxView==nil) {
        mainboxView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 315, 130)];
        mainboxView.layer.borderColor = [UIColor colorWithHexString:@"#444444" withAlpha:0.5].CGColor;
        mainboxView.layer.borderWidth = 0.5;
        mainboxView.userInteractionEnabled = YES;
        [self addSubview:mainboxView];
        // 添加手指捏合手势，放大或缩小k线图
        pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(touchBoxAction:)];
        [mainboxView addGestureRecognizer:pinchGesture];
        UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] init];
        [longPressGestureRecognizer addTarget:self action:@selector(gestureRecognizerHandle:)];
        [longPressGestureRecognizer setMinimumPressDuration:0.3f];
        [longPressGestureRecognizer setAllowableMovement:36.0];
        [self addGestureRecognizer:longPressGestureRecognizer];
    }
    
    if (!isUpdate) {
        // k线图分割线
        CGFloat padRealValue = mainboxView.frame.size.height / 4;
        for (int i = 0; i<4; i++) {
            CGFloat y = mainboxView.frame.size.height-padRealValue * i;
            lines *line = [[lines alloc] initWithFrame:CGRectMake(0, 0, mainboxView.frame.size.width, mainboxView.frame.size.height)];
            line.color = @"#999999";
            line.alpha = 0.5;
            line.startPoint = CGPointMake(0, y);
            line.endPoint = CGPointMake(mainboxView.frame.size.width, y);
            [mainboxView addSubview:line];
        }
    }
    
    // 显示开始日期控件
    if (startDateLab==nil) {
        startDateLab = [[UILabel alloc] initWithFrame:CGRectMake(1
                                                                 , 131
                                                                 , 50, 8)];
        startDateLab.font = [UIFont systemFontOfSize:8];
        startDateLab.text = @"--";
        startDateLab.textColor = [UIColor grayColor];
        startDateLab.backgroundColor = [UIColor clearColor];
        [mainboxView addSubview:startDateLab];
    }
    
    // 显示结束日期控件
    if (endDateLab==nil) {
        endDateLab = [[UILabel alloc] initWithFrame:CGRectMake(270
                                                               ,131
                                                               , 50, 8)];
        endDateLab.font = [UIFont systemFontOfSize:8];
        endDateLab.text = @"--";
        endDateLab.textColor = [UIColor grayColor];
        endDateLab.backgroundColor = [UIColor clearColor];
        [mainboxView addSubview:endDateLab];
    }
    
    // MA5 均线价格显示控件
    if (MA5==nil) {
        MA5 = [[UILabel alloc] initWithFrame:CGRectMake(100, -8, 30, 8)];
        MA5.backgroundColor = [UIColor clearColor];
        MA5.font = [UIFont systemFontOfSize:8];
        MA5.text = @"MA5";
        MA5.textColor = [UIColor colorWithHexString:@"#d83dd9" withAlpha:1];
        [MA5 sizeToFit];
        [self addSubview:MA5];
    }
    
    
    // MA10 均线价格显示控件
    if (MA10==nil) {
        MA10 = [[UILabel alloc] initWithFrame:CGRectMake(MA5.frame.origin.x +MA5.frame.size.width +10, -8, 30, 8)];
        MA10.backgroundColor = [UIColor clearColor];
        MA10.font = [UIFont systemFontOfSize:8];
        MA10.text = @"MA10";
        MA10.textColor = [UIColor colorWithHexString:@"#ebac31" withAlpha:1];
        [MA10 sizeToFit];
        [self addSubview:MA10];
    }
    
    
    // MA20 均线价格显示控件
    if (MA20==nil) {
        MA20 = [[UILabel alloc] initWithFrame:CGRectMake(MA10.frame.origin.x +MA10.frame.size.width +10, -8, 30, 8)];
        MA20.backgroundColor = [UIColor clearColor];
        MA20.font = [UIFont systemFontOfSize:8];
        MA20.text = @"MA20";
        MA20.textColor = [UIColor colorWithHexString:@"#2e87e2" withAlpha:1];
        [MA20 sizeToFit];
        [self addSubview:MA20];
    }
    
    // 画个成交量的框框
    if (bottomBoxView==nil) {
        bottomBoxView = [[UIView alloc] initWithFrame:CGRectMake(0,140, 315, 75)];
        bottomBoxView.layer.borderColor = [UIColor colorWithHexString:@"#444444" withAlpha:0.5].CGColor;
        bottomBoxView.layer.borderWidth = 0.5;
        bottomBoxView.userInteractionEnabled = YES;
        [mainboxView addSubview:bottomBoxView];
    }
    
    if (!isUpdate) {
        // 成交量分割线
        CGFloat padRealValue = bottomBoxView.frame.size.height / 3;
        for (int i = 0; i<3; i++) {
            CGFloat y = bottomBoxView.frame.size.height-padRealValue * i;
            lines *line = [[lines alloc] initWithFrame:CGRectMake(0, 0, bottomBoxView.frame.size.width, bottomBoxView.frame.size.height)];
            line.color = @"#999999";
            line.alpha = 0.5;
            line.startPoint = CGPointMake(0, y);
            line.endPoint = CGPointMake(bottomBoxView.frame.size.width, y);
            [bottomBoxView addSubview:line];
        }
    }
    
    //手1
    shou1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 141, 50,8)];
    shou1.text =@"7.5万";
    shou1.font = [UIFont systemFontOfSize:8];
    [shou1 setTextColor:[UIColor grayColor]];
    [self addSubview:shou1];
    
    //手2
    shou2 = [[UILabel alloc]initWithFrame:CGRectMake(1, 166, 50,8)];
    shou2.text =@"5万";
    shou2.font = [UIFont systemFontOfSize:8];
    [shou2 setTextColor:[UIColor grayColor]];
    [self addSubview:shou2];
    
    //手3
    shou3 = [[UILabel alloc]initWithFrame:CGRectMake(1, 191, 50,8)];
    shou3.text =@"2.5万";
    shou3.font = [UIFont systemFontOfSize:8];
    [shou3 setTextColor:[UIColor grayColor]];
    [self addSubview:shou3];
    
}

#pragma mark 画k线
-(void)drawLine{
    self.kCount = self.xWidth / (self.kLineWidth+self.kLinePadding) + 1; // K线中实体的总数
    
    getdata = [[getData alloc] init];
    getdata.kCount = self.kCount;
    
    [getdata changeRKData:_riKArry];
    self.data = getdata.data;
    
    // 开始画K线图
    [self drawBoxWithKline];
    
    //NSLog(@"处理得dddd");
    // 清除旧的k线
    if (lineOldArray.count>0 && isUpdate) {
        for (lines *line in lineOldArray) {
            [line removeFromSuperview];
        }
    }
    lineOldArray = lineArray.copy;
    
    if (_finishUpdateBlock && isPinch) {
        _finishUpdateBlock(self);
    }
    isUpdateFinish = YES;
    // 结束线程
    [thread cancel];
}


#pragma mark 在框框里画k线
-(void)drawBoxWithKline{
    
    // 平均线
    CGFloat padValue = (getdata.maxValue - getdata.minValue) / 4;
    CGFloat padRealValue = mainboxView.frame.size.height / 4;
    for (int i = 0; i<5; i++) {
        CGFloat y = mainboxView.frame.size.height-padRealValue * i;
        // lable
        UILabel *leftTag = [[UILabel alloc] initWithFrame:CGRectMake(0, y-30/2-3, 38, 30)];
        leftTag.text = [[NSString alloc] initWithFormat:@"%.2f",padValue*i+getdata.minValue];
        leftTag.textColor = [UIColor grayColor];
        leftTag.font = self.font;
        //[leftTag sizeToFit];
        [mainboxView addSubview:leftTag];
        [lineArray addObject:leftTag];
    }
    
    
    
    // 开始画连接均线
    [self drawMAWithIndex:7 andColor:@"#d83dd9"];//MA5,黄色
    [self drawMAWithIndex:8 andColor:@"#ebac31"];//MA10,蓝色
    [self drawMAWithIndex:9 andColor:@"#2e87e2"];//MA20,蓝色
    
    
    // 开始画连K线
    // x轴从0 到 框框的宽度 mainboxView.frame.size.width 变化  y轴为每个间隔的连线，如，今天的点连接明天的点
    NSArray *ktempArray = [self changeKPointWithData:getdata.data]; // 换算成实际每天收盘价坐标数组
    lines *kline = [[lines alloc] initWithFrame:CGRectMake(0, 0, mainboxView.frame.size.width, mainboxView.frame.size.height)];
    kline.points = ktempArray;
    kline.lineWidth = self.kLineWidth;
    kline.isK = YES;
    [mainboxView addSubview:kline];
    [lineArray addObject:kline];
    
    // 在成交量视图左右下方显示开始和结束日期
    NSString *tempStr1 =[[getdata.data objectAtIndex:0]objectAtIndex:0];
    startDateLab.text = [NSString stringWithFormat:@"%@-%@-%@",[tempStr1 substringWithRange:NSMakeRange (0,4)],[tempStr1 substringWithRange:NSMakeRange (4,2)],[tempStr1 substringWithRange:NSMakeRange (6,2)]];
    NSString *tempStr2 = [[getdata.data objectAtIndex:getdata.data.count-1]objectAtIndex:0];
    endDateLab.text = [NSString stringWithFormat:@"%@-%@-%@",[tempStr2 substringWithRange:NSMakeRange (0,4)],[tempStr2 substringWithRange:NSMakeRange (4,2)],[tempStr2 substringWithRange:NSMakeRange (6,2)]];
    
    // 开始画连成交量
    NSArray *voltempArray = [self changeVolumePointWithData:getdata.data]; // 换算成实际成交量坐标数组
    //NSLog(@"voltempArray:%@",voltempArray);
    lines *volline = [[lines alloc] initWithFrame:CGRectMake(0, 0, bottomBoxView.frame.size.width, bottomBoxView.frame.size.height)];
    volline.points = voltempArray;
    volline.lineWidth = self.kLineWidth;
    volline.isK = YES;
    volline.isVol = YES;
    [bottomBoxView addSubview:volline];
//    shou1.text = [commond changePrice:getdata.volMaxValue];
//    shou2.text = [commond changePrice:getdata.volMaxValue/3*2];
//    shou3.text = [commond changePrice:getdata.volMaxValue/3];
    [lineArray addObject:volline];
}

#pragma mark 画各种均线
-(void)drawMAWithIndex:(int)index andColor:(NSString*)color{
    NSArray *tempArray = [self changePointWithData:getdata.data andMA:index]; // 换算成实际坐标数组
    lines *line = [[lines alloc] initWithFrame:CGRectMake(0, 0, mainboxView.frame.size.width, mainboxView.frame.size.height)];
    line.color = color;
    line.points = tempArray;
    //NSLog(@"date:%d",_date());
    line.isK = NO;
    [mainboxView addSubview:line];
    [lineArray addObject:line];
}

#pragma mark 把股市数据换算成实际的点坐标数组
-(NSArray*)changeKPointWithData:(NSArray*)data{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    pointArray = [[NSMutableArray alloc] init];
    CGFloat PointStartX = self.kLineWidth/2; // 起始点坐标
    //NSLog(@"date:%@",data);
    for (NSArray *item in data) {
        CGFloat heightvalue = [[item objectAtIndex:2] floatValue];// 得到最高价
        CGFloat lowvalue = [[item objectAtIndex:3] floatValue];// 得到最低价
        CGFloat openvalue = [[item objectAtIndex:1] floatValue];// 得到开盘价
        CGFloat closevalue = [[item objectAtIndex:4] floatValue];// 得到收盘价
        CGFloat yHeight = getdata.maxValue - getdata.minValue ; // y的价格高度
        CGFloat yViewHeight = mainboxView.frame.size.height ;// y的实际像素高度
        // 换算成实际的坐标
        CGFloat heightPointY = yViewHeight * (1 - (heightvalue - getdata.minValue) / yHeight);
        CGPoint heightPoint =  CGPointMake(PointStartX, heightPointY); // 最高价换算为实际坐标值
        CGFloat lowPointY = yViewHeight * (1 - (lowvalue - getdata.minValue) / yHeight);;
        CGPoint lowPoint =  CGPointMake(PointStartX, lowPointY); // 最低价换算为实际坐标值
        CGFloat openPointY = yViewHeight * (1 - (openvalue - getdata.minValue) / yHeight);;
        CGPoint openPoint =  CGPointMake(PointStartX, openPointY); // 开盘价换算为实际坐标值
        CGFloat closePointY = yViewHeight * (1 - (closevalue - getdata.minValue) / yHeight);;
        CGPoint closePoint =  CGPointMake(PointStartX, closePointY); // 收盘价换算为实际坐标值
        // 实际坐标组装为数组
        NSArray *currentArray = [[NSArray alloc] initWithObjects:
                                 NSStringFromCGPoint(heightPoint),
                                 NSStringFromCGPoint(lowPoint),
                                 NSStringFromCGPoint(openPoint),
                                 NSStringFromCGPoint(closePoint),
                                 [item objectAtIndex:0], // 保存日期时间
                                 [item objectAtIndex:4], // 收盘价
                                 [item objectAtIndex:7], // MA5
                                 [item objectAtIndex:8], // MA10
                                 [item objectAtIndex:9], // MA20
                                 [item objectAtIndex:2],//最高价
                                 [item objectAtIndex:3],//最低价
                                 [item objectAtIndex:1],//开盘价
                                 [item objectAtIndex:5],//成交量
                                 [item objectAtIndex:6],//成交金额
                                 
                                 nil];
        [tempArray addObject:currentArray]; // 把坐标添加进新数组
        currentArray = Nil;
        PointStartX += self.kLineWidth+self.kLinePadding; // 生成下一个点的x轴
        
    }
    pointArray = tempArray;
    return tempArray;
}

#pragma mark 把股市数据换算成实际的点坐标数组
-(NSArray*)changePointWithData:(NSArray*)data  andMA:(int)MAIndex{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    CGFloat PointStartX = 0.0f; // 起始点坐标
    for (NSArray *item in data) {
        CGFloat currentValue = [[item objectAtIndex:MAIndex] floatValue];// 得到均价价格
        // 换算成实际的坐标
        CGFloat currentPointY = mainboxView.frame.size.height - ((currentValue - getdata.minValue) / (getdata.maxValue - getdata.minValue) * mainboxView.frame.size.height);
        CGPoint currentPoint =  CGPointMake(PointStartX, currentPointY); // 换算到当前的坐标值
        [tempArray addObject:NSStringFromCGPoint(currentPoint)]; // 把坐标添加进新数组
        PointStartX += self.kLineWidth+self.kLinePadding; // 生成下一个点的x轴
    }
    return tempArray;
}

#pragma mark 把股市数据换算成成交量的实际坐标数组
-(NSArray*)changeVolumePointWithData:(NSArray*)data{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    CGFloat PointStartX = self.kLineWidth/2; // 起始点坐标
    for (NSArray *item in data) {
        CGFloat volumevalue = [[item objectAtIndex:5] floatValue];// 得到每份成交量
        CGFloat yHeight = getdata.volMaxValue - getdata.volMinValue ; // y的价格高度
        CGFloat yViewHeight = bottomBoxView.frame.size.height ;// y的实际像素高度
        // 换算成实际的坐标
        CGFloat volumePointY = yViewHeight * (1 - (volumevalue - getdata.volMinValue) / yHeight);
        CGPoint volumePoint =  CGPointMake(PointStartX, volumePointY); // 成交量换算为实际坐标值
        CGPoint volumePointStart = CGPointMake(PointStartX, yViewHeight);
        // 把开盘价收盘价放进去好计算实体的颜色
        CGFloat openvalue = [[item objectAtIndex:1] floatValue];// 得到开盘价
        CGFloat closevalue = [[item objectAtIndex:4] floatValue];// 得到收盘价
        CGPoint openPoint =  CGPointMake(PointStartX, closevalue); // 开盘价换算为实际坐标值
        CGPoint closePoint =  CGPointMake(PointStartX, openvalue); // 收盘价换算为实际坐标值
        
        
        // 实际坐标组装为数组
        NSArray *currentArray = [[NSArray alloc] initWithObjects:
                                 NSStringFromCGPoint(volumePointStart),
                                 NSStringFromCGPoint(volumePoint),
                                 NSStringFromCGPoint(openPoint),
                                 NSStringFromCGPoint(closePoint),
                                 nil];
        [tempArray addObject:currentArray]; // 把坐标添加进新数组
        currentArray = Nil;
        PointStartX += self.kLineWidth+self.kLinePadding; // 生成下一个点的x轴
        
    }
    // NSLog(@"处理完成");
    
    return tempArray;
}

#pragma mark 手指捏合动作
-(void)touchBoxAction:(UIPinchGestureRecognizer*)pGesture{
    isPinch  = NO;
    //NSLog(@"状态：%li==%f",(long)pinchGesture.state,pGesture.scale);
    if (pGesture.state==2 && isUpdateFinish) {
        if (pGesture.scale>1) {
            // 放大手势
            self.kLineWidth ++;
            [self updateSelf];
        }else{
            // 缩小手势
            self.kLineWidth --;
            [self updateSelf];
        }
    }
    if (pGesture.state==3) {
        isUpdateFinish = YES;
    }
}
// 缩小手势,放大手势
-(void)updateSelf{
    if (isUpdateFinish) {
        if (self.kLineWidth>20)
            self.kLineWidth = 20;
        if (self.kLineWidth<1)
            self.kLineWidth = 1;
        isUpdateFinish = NO;
        isUpdate = YES;
        self.data = nil;
        pointArray = nil;
        if (!thread.isCancelled) {
            [thread cancel];
        }
        self.clearsContextBeforeDrawing = YES;
        [thread cancel];
        thread = [[NSThread alloc] initWithTarget:self selector:@selector(drawLine) object:nil];
        [thread start];
        
    }
}

#pragma mark 长按就开始生成十字线
-(void)gestureRecognizerHandle:(UILongPressGestureRecognizer*)longResture{
    isPinch = YES;
    //NSLog(@"gestureRecognizerHandle%li",(long)longResture.state);
    touchViewPoint = [longResture locationInView:mainboxView];
    // 手指长按开始时更新一般
    if(longResture.state == UIGestureRecognizerStateBegan){
        [self update];
    }
    // 手指移动时候开始显示十字线
    if (longResture.state == UIGestureRecognizerStateChanged) {
        [self isKPointWithPoint:touchViewPoint];
    }
    
    // 手指离开的时候移除十字线
    if (longResture.state == UIGestureRecognizerStateEnded) {
        [movelineone removeFromSuperview];
        [movelinetwo removeFromSuperview];
        [xxView removeFromSuperview];
        [movelinetwoLable removeFromSuperview];
        
        movelineone = nil;
        movelinetwo = nil;
        xxView = nil;
        movelinetwoLable = nil;
        isPinch = NO;
    }
}

#pragma mark 判断并在十字线上显示提示信息
-(void)isKPointWithPoint:(CGPoint)point{
    CGFloat itemPointX = 0;
    for (NSArray *item in pointArray) {
        //NSLog(@"item:%@",item);
        
        CGPoint itemPoint = CGPointFromString([item objectAtIndex:0]);  // 收盘价的坐标
        itemPointX = itemPoint.x;
        int itemX = (int)itemPointX;
        int pointX = (int)point.x;
        if (itemX==pointX || point.x-itemX<=self.kLineWidth/2) {
            movelineone.frame = CGRectMake(itemPointX,movelineone.frame.origin.y, movelineone.frame.size.width, movelineone.frame.size.height);
            movelinetwo.frame = CGRectMake(movelinetwo.frame.origin.x,itemPoint.y, movelinetwo.frame.size.width, movelinetwo.frame.size.height);
            // 垂直提示成交价格
            NSString *tempStr =[item objectAtIndex:4];
            riqLable.text = [NSString stringWithFormat:@"%@-%@-%@",[tempStr substringWithRange:NSMakeRange (0,4)],[tempStr substringWithRange:NSMakeRange (4,2)],[tempStr substringWithRange:NSMakeRange (6,2)]];//日期
            kpLable.text =[NSString stringWithFormat:@"开盘:%@",[item objectAtIndex:11]];
            zgLable.text =[NSString stringWithFormat:@"最高:%@",[item objectAtIndex:9]];
            zdLable.text =[NSString stringWithFormat:@"最低:%@",[item objectAtIndex:10]];
            spLable.text =[NSString stringWithFormat:@"收盘:%@",[item objectAtIndex:5]];
//            cjlLable.text =[NSString stringWithFormat:@"成交量:%@",[commond changePrice:[[item objectAtIndex:12]floatValue]]];
//            cjeLable.text =[NSString stringWithFormat:@"成交额:%@",[commond changePrice:[[item objectAtIndex:13]floatValue]]];
            zflLable.text =[NSString stringWithFormat:@"涨幅:%.2f%%",([[item objectAtIndex:5]floatValue]-[[item objectAtIndex:11]floatValue])/[[item objectAtIndex:11]floatValue]*100];
            CGFloat oneLableY = bottomBoxView.frame.origin.y;
            CGFloat oneLableX = 0;
            if (itemPointX<xxView.frame.size.width/2) {
                oneLableX = xxView.frame.size.width/2 - itemPointX;
            }
            if ((mainboxView.frame.size.width - itemPointX)<xxView.frame.size.width/2) {
                oneLableX = -(xxView.frame.size.width/2 - (mainboxView.frame.size.width - itemPointX));
            }
            xxView.frame = CGRectMake(itemPointX - xxView.frame.size.width/2 + oneLableX, oneLableY,
                                      xxView.frame.size.width, xxView.frame.size.height);
            
            //NSLog(@"item:%@",item);
            // 横向提示成交数量
            movelinetwoLable.text = [item objectAtIndex:5]; //
            CGFloat twoLableX = movelinetwoLable.frame.origin.x;
            // 如果滑动到了左半边则提示向右跳转
            if ((mainboxView.frame.size.width - itemPointX) > mainboxView.frame.size.width/2) {
                twoLableX = mainboxView.frame.size.width - movelinetwoLable.frame.size.width;
            }else{
                twoLableX = 0;
            }
            movelinetwoLable.frame = CGRectMake(twoLableX,itemPoint.y - movelinetwoLable.frame.size.height/2 ,
                                                movelinetwoLable.frame.size.width, movelinetwoLable.frame.size.height);
            
            
            break;
        }
    }
    
}

-(void)update{
    if (self.kLineWidth>20)
        self.kLineWidth = 20;
    if (self.kLineWidth<1)
        self.kLineWidth = 1;
    isUpdate = YES;
    if (!thread.isCancelled) {
        [thread cancel];
    }
    self.clearsContextBeforeDrawing = YES;
    
    [thread cancel];
    thread = [[NSThread alloc] initWithTarget:self selector:@selector(drawLine) object:nil];
    [thread start];
    
}


-(void)dealloc{
    thread = nil;
}




@end
