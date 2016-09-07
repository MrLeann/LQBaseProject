//
//  getData.m
//  Kline
//
//  Created by zhaomingxi on 14-2-10.
//  Copyright (c) 2014年 zhaomingxi. All rights reserved.
//

#import "getData.h"


@implementation getData


-(id)init{
    self = [super init];
    if (self){
        self.isFinish = NO;
        self.maxValue = 0;
        self.minValue = CGFLOAT_MAX;
        self.volMaxValue = 0;
        self.volMinValue = CGFLOAT_MAX;
    }
    return  self;
}

//解析具体数据并赋值组合
-(void)changeFSData:(NSArray*)lines{
    NSMutableArray *data =[[NSMutableArray alloc] init];
    //NSMutableArray *category =[[NSMutableArray alloc] init];
    NSArray *newArray = lines;
    newArray = [newArray objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, self.kCount>=newArray.count?newArray.count:self.kCount)]]; // 只要前面指定的数据
    
    NSInteger idx;
    
    for (idx = 0; idx < newArray.count; idx++) {
        
        if (idx > 0)
        {
            NSString *bfLine = [newArray objectAtIndex:idx-1];//前面一个数组
            NSString *line = [newArray objectAtIndex:idx];
            if([line isEqualToString:@""]){
                continue;
            }
            NSArray   *bfArr = [bfLine componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
            NSArray   *arr = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
            
            // 收盘价的最小值和最大值
            if ([[arr objectAtIndex:1] floatValue]>self.maxValue) {
                self.maxValue = [[arr objectAtIndex:1] floatValue];
            }
            if ([[arr objectAtIndex:1] floatValue]<self.minValue) {
                self.minValue = [[arr objectAtIndex:1] floatValue];
            }
            
            float crtVol = [[arr objectAtIndex:2] floatValue] - [[bfArr objectAtIndex:2] floatValue];//当前累加的数据减去上一个得到成交量
            //NSLog(@"crtVol:%.2f",crtVol);
            // 成交量的最大值最小值
            if (crtVol>self.volMaxValue) {
                self.volMaxValue = crtVol;
            }
            if (crtVol<self.volMinValue) {
                self.volMinValue = crtVol;
            }
            NSMutableArray *item =[[NSMutableArray alloc] init];
            
            [item addObject:[arr objectAtIndex:0]]; // 成交均价
            [item addObject:[arr objectAtIndex:1]]; // 成交价格
            [item addObject:[NSString stringWithFormat:@"%.0f",crtVol]]; // 成交数量
            [item addObject:[arr objectAtIndex:3]]; // 成交金额
            
            [data addObject:item]; //组合总data
            
        }
        else{
            NSString *line = [newArray objectAtIndex:idx];
            if([line isEqualToString:@""]){
                continue;
            }
            NSArray   *arr = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
            // 收盘价的最小值和最大值
            if ([[arr objectAtIndex:1] floatValue]>self.maxValue) {
                self.maxValue = [[arr objectAtIndex:1] floatValue];
            }
            if ([[arr objectAtIndex:1] floatValue]<self.minValue) {
                self.minValue = [[arr objectAtIndex:1] floatValue];
            }
            // 成交量的最大值最小值
            if ([[arr objectAtIndex:2] floatValue]>self.volMaxValue) {
                self.volMaxValue = [[arr objectAtIndex:2] floatValue];
                //NSLog(@"volMaxValue:%f",self.volMaxValue);
            }
            if ([[arr objectAtIndex:2] floatValue]<self.volMinValue) {
                self.volMinValue = [[arr objectAtIndex:2] floatValue];
                //NSLog(@"volMinValue:%f",self.volMinValue);
            }
            NSMutableArray *item =[[NSMutableArray alloc] init];
            
            [item addObject:[arr objectAtIndex:0]]; // 成交均价
            [item addObject:[arr objectAtIndex:1]]; // 成交价格
            [item addObject:[arr objectAtIndex:2]]; // 成交数量
            [item addObject:[arr objectAtIndex:3]]; // 成交金额
            
            
            [data addObject:item]; //组合总data
            
            //NSLog(@"self.volMaxValue:%.2f",self.volMaxValue);
            
        }
        
    }
    
    
    //NSLog(@"data:%@",data);
    if(data.count==0){
        self.status.text = @"Error!";
        return;
    }
    
    self.data = data;
}

-(void)changeRKData:(NSArray*)lines{
    NSMutableArray *data =[[NSMutableArray alloc] init];
    NSArray *newArray = lines;
    newArray = [newArray objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, self.kCount>=newArray.count?newArray.count:self.kCount)]]; // 只要前面指定的数据
    
    NSInteger idx;
    int MA5=5,MA10=10,MA20=20; // 均线统计
    for (idx = newArray.count-1; idx >= 0; idx--) {
        
        NSString *line = [newArray objectAtIndex:idx];
        if([line isEqualToString:@""]){
            continue;
        }
        NSArray   *arr = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        // 收盘价的最小值和最大值
        if ([[arr objectAtIndex:4] floatValue]>self.maxValue) {
            self.maxValue = [[arr objectAtIndex:4] floatValue];
        }
        if ([[arr objectAtIndex:4] floatValue]<self.minValue) {
            self.minValue = [[arr objectAtIndex:4] floatValue];
        }
        // 成交量的最大值最小值
        if ([[arr objectAtIndex:5] floatValue]>self.volMaxValue) {
            self.volMaxValue = [[arr objectAtIndex:5] floatValue];
            //NSLog(@"volMaxValue:%f",self.volMaxValue);
        }
        if ([[arr objectAtIndex:5] floatValue]<self.volMinValue) {
            self.volMinValue = [[arr objectAtIndex:5] floatValue];
            //NSLog(@"volMinValue:%f",self.volMinValue);
        }
        NSMutableArray *item =[[NSMutableArray alloc] init];
        
        [item addObject:[arr objectAtIndex:0]]; // 日期
        [item addObject:[arr objectAtIndex:1]]; // 今日开盘
        [item addObject:[arr objectAtIndex:2]]; // 最高成交
        [item addObject:[arr objectAtIndex:3]]; // 最低成交
        [item addObject:[arr objectAtIndex:4]]; // 最近成交
        [item addObject:[arr objectAtIndex:5]]; // 成交数量
        [item addObject:[arr objectAtIndex:6]]; // 成交金额
        
        CGFloat idxLocation = [lines indexOfObject:line];
        // MA5
        [item addObject:[NSNumber numberWithFloat:[self sumArrayWithData:lines andRange:NSMakeRange(idxLocation, MA5)]]]; // 前五日收盘价平均值
        // MA10
        [item addObject:[NSNumber numberWithFloat:[self sumArrayWithData:lines andRange:NSMakeRange(idxLocation, MA10)]]]; // 前十日收盘价平均值
        // MA20
        [item addObject:[NSNumber numberWithFloat:[self sumArrayWithData:lines andRange:NSMakeRange(idxLocation, MA20)]]]; // 前二十日收盘价平均值
        
        [data addObject:item]; //组合总data
        
    }
    //NSLog(@"data:%@",data);
    if(data.count==0){
        self.status.text = @"Error!";
        return;
    }
    
    self.data = data;
}


-(CGFloat)sumArrayWithData:(NSArray*)data andRange:(NSRange)range{
    CGFloat value = 0;
    if (data.count - range.location>range.length) {
        NSArray *newArray = [data objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:range]];
        for (NSString *item in newArray) {
            NSArray *arr = [item componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
            value += [[arr objectAtIndex:4] floatValue];//最近成交
        }
        if (value>0) {
            value = value/ newArray.count;
        }
    }
    return value;
}






@end
