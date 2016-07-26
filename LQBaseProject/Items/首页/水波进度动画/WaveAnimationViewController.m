
//
//  WaveAnimationViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/23.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "WaveAnimationViewController.h"
#import "WaveGraph.h"//水波动画View

@interface WaveAnimationViewController ()
{
    CGFloat w;
    UIView *v;
    
    UILabel *lab;
    
    UILabel *dayLabel;
    
    NSInteger index;
    NSArray *arr;
    
    WaveGraph *waveView;
}

@property (nonatomic, copy)NSString *scheduleStr;//进度数字
@property (nonatomic, copy)NSString *dayStr;

@end

@implementation WaveAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scheduleStr = @"55";
    
    [self mInitUI];
}

-(void)mInitUI{
    self.view.backgroundColor = [UIColor whiteColor];
   
    arr = @[@"设计",@"开发",@"测试",@"验收",@"完成"];
    
    [self stepMoreView];
}

-(void)stepMoreView
{
    CGFloat with = [UIScreen mainScreen].bounds.size.width - 160 + 80 + 30;
    CGFloat addh = [UIScreen mainScreen].bounds.size.height  - (with + 65 + 30 + 130) - 64;
    if (addh < 0) {
        addh = 0;
    }
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height )];
    sc.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, with + 65 + 30 + 130 + 60);
    [self.view addSubview:sc];
    //大背景图片
    UIImageView *backImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, with + 65 + 30 + 130 + addh)];
    backImageV.image = [UIImage imageNamed:@"jdBack"];
    [sc addSubview:backImageV];
    
    NSInteger www = [UIScreen mainScreen].bounds.size.width;
    if (www  - 320 ==0) {     //适配屏幕。iPhone4、5  减小5尺寸
        www = 5;
    }else   www = 0;
    
    //外面最大圆View
    UIView *yuanView1 = [[UIView alloc]initWithFrame:CGRectMake(80 + www, 80 + www, ([UIScreen mainScreen].bounds.size.width - 160 -2 * www ), ([UIScreen mainScreen].bounds.size.width - 160  - 2 * www))];
    yuanView1.backgroundColor = [UIColor colorWithRed:131/255.0 green:187/255.0 blue:230/255.0 alpha:1.0];
    yuanView1.layer.cornerRadius = ([UIScreen mainScreen].bounds.size.width - 160 -  2 * www)/2;//切圆
    [sc addSubview:yuanView1];
    
    
    //圆宽高
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 190;
    
    CGFloat originY = 95;
    
    waveView = [[WaveGraph alloc]initWithFrame:CGRectMake((kWindowWidth - width)/2, originY, width, width)];
    
    //百分比
    [waveView setProgress:[self.scheduleStr floatValue] animated:YES];
    
    [sc addSubview:waveView];
    
    
    //百分比label
    NSInteger indexd = [self.scheduleStr floatValue] * 100;
    lab = [[UILabel alloc]initWithFrame:waveView.frame];
//    lab.text = [NSString stringWithFormat:@"  %02ld%%\n%@",indexd, arr[indexd/20]];//这个报错，为毛
    lab.numberOfLines = 0;
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18];
    [sc addSubview:lab];
    
//    [lab setRangeSize:2 font:40 starIndex:2 index:2 rangeColor:[UIColor whiteColor]];//范围内字体和颜色
    
    //项目天数label
    dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, with, 200, 65)];
    dayLabel.text = [NSString stringWithFormat:@"总项目还剩天数:\n%@天",self.dayStr];
    dayLabel.font = [UIFont boldSystemFontOfSize:17];
    dayLabel.textColor = [UIColor whiteColor];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.numberOfLines = 3;
    
//    [dayLabel setSpace:dayLabel.text lineSpace:5 paraSpace:5 alignment:2 kerSpace:1];
    
    [sc addSubview:dayLabel];
    
    //下面透明背景View
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, with + 65 + 30 + addh, [UIScreen mainScreen].bounds.size.width, 130)];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.2;
    [sc addSubview:backView];
    
    NSInteger h = [UIScreen mainScreen].bounds.size.width;
    CGFloat hh = 20 + (h/375) *5 + (h /414) *5;
    
    //进度条背景View
    v = [[UIView alloc]initWithFrame:CGRectMake(30,  with + 65 + 30 + 40 + addh,[self.scheduleStr floatValue] * (kWindowWidth - 60), hh)];
    
    //没黄色进度图片
    UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, with + 65 + 30 + 40 + addh, ([UIScreen mainScreen].bounds.size.width - 60), hh)];
    [imageV1 setImage:[UIImage imageNamed:@"jdt1"]];
    
    v.clipsToBounds = YES;
    
    //黄色进度图片
    UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,([UIScreen mainScreen].bounds.size.width - 60), hh)];
    [imageV2 setImage:[UIImage imageNamed:@"jdt2"]];
    
    [sc addSubview:imageV1];
    
    [sc addSubview:v];
    [v addSubview:imageV2];
    
    CGFloat ww = ([UIScreen mainScreen].bounds.size.width - 20)/5;
    for (NSInteger i = 0; i< 5; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10 + ww*i,with + 65 + 30 + 40 +25 + 10 + addh , ww, 25)];
        label.text = [NSString stringWithFormat:@"%@",arr[i]];
        label.font = [UIFont boldSystemFontOfSize:16];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [sc addSubview:label
         ];
    }
    
}


@end
