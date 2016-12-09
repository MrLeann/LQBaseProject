//  DateSelectVC.m
//  LQBaseProject
//  Created by YZR on 16/12/7.
//  Copyright © 2016年 YZR. All rights reserved.

#import "DateSelectVC.h"

#import "STPickerSingle.h"
#import "STPickerDate.h"

@interface DateSelectVC ()<STPickerSingleDelegate, STPickerDateDelegate>{
    
     NSArray *_dataArray;
}

@end

@implementation DateSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mInitData];
}

// 初始化数据
-(void)mInitData{
    
  self.title = @"日期选择器";

}

#pragma mark - 屏幕点击
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@" --- 输出屏幕点击 ---");
    
    STPickerDate *pickerDate = [[STPickerDate alloc]init];
    [pickerDate setDelegate:self];
    [pickerDate show];
    
}

#pragma mark - 日期选择协议
- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    
    NSString *text = [NSString stringWithFormat:@"%zd年%zd月%zd日", year, month, day];
    NSLog(@"输出 = %@",text);
}



- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    NSString *text = [NSString stringWithFormat:@"%@ 人民币", selectedTitle];
  NSLog(@"输出选择的人民币 = %@",text);
}



@end






