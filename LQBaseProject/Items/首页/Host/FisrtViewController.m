//  FisrtViewController.m
//  LQBaseProject
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.

#import "FisrtViewController.h"
#import "TwoDimensionCodeViewController.h"
#import "CreateCodeTableViewController.h"//二维码生成
#import "SlideDeleteViewController.h"//cell滑动删除
#import "GestureTableViewController.h"//手势解锁
#import "BAButtonViewController.h"//图片按钮布局
#import "DCLabelViewController.h"//插入图片
#import "WaveAnimationViewController.h"//水波动画
#import "CandlestickChartTableVC.h"// K线图
#import "TableViewAnimationController.h"//表格效果
#import "CountrySelectTableVC.h"//国家电话区号选择
#import "PulldownHostVC.h"//下拉列表
#import "InputPassWordVC.h"//密码输入框弹出
#import "InPutVC.h"//输入框
#import "SlipGestureVC.h"//左右滑动的控制器
#import "ReminderTableVIew.h"//提现
#import "PopUpViewController.h"//弹出框View
#import "GetImageSizeVC.h"//获取图片尺寸
#import "LQRefreshViewController.h"//刷新表格头部动画
#import "ReminderTableVIew.h"//类似微博提示框
#import "HTMLViewController.h"//html5应用
#import "CheckVersionViewController.h"//检测版本更新
#import "KeyBoardViewController.h"//键盘下移
#import "CitySelectTableViewController.h"//城市选择器
#import "FaceRecognizerVC.h"//人脸识别

@interface FisrtViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}

//表格控件
@property (weak, nonatomic) IBOutlet UITableView *vTableView;
@property(nonatomic,strong)NSArray *listTitleArr;

@end

@implementation FisrtViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self mTableViewSetting];
    
    
}

-(void)mTableViewSetting{
    
    //去掉尾部分割线
    self.vTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //分割线偏移
    self.vTableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.vTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //
    self.listTitleArr = @[@"1 - 二维码扫描",@"2 - 二维码条形码生成",@"3 -cell滑动删除 ",@"4 -手势解锁",@"5 -图片按钮布局",@"6 -插入图片",@"7 -水波动画",@"8 - K线图 ",@"9 - TableView常见效果",@"10 - 国家区号选择",@"11 - 下拉列表",@"12 - 密码输入框",@"13 - 输入框",@"14 - 仿网易类型左右滑动",@"15 - 弹出框View",@"16 - 获取图片尺寸",@"17 -表格头部刷新动画",@"18 - 类似微博提示框",@"19 - HTML应用",@"20- 检测版本更新",@"21 - 键盘下移",@"22 - 城市选择器",@"23 - 人脸识别"];
    
    
    
    //高度设置
    self.vTableView.rowHeight = 40;
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeCell"];
}

#pragma mark - 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listTitleArr.count;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.listTitleArr[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:13.0];
   
    //返回cell里面，点击无色设置
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        TwoDimensionCodeViewController *vc = [TwoDimensionCodeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        
        CreateCodeTableViewController *vc2 = [CreateCodeTableViewController new];
        [self.navigationController pushViewController:vc2 animated:YES];
        
    }else if (indexPath.row == 2){
        
        SlideDeleteViewController *vc3 = [SlideDeleteViewController new];
        [self.navigationController pushViewController:vc3 animated:YES];
    }else if (indexPath.row == 3){
        
        GestureTableViewController *vc4 = [GestureTableViewController new];
        [self.navigationController pushViewController:vc4 animated:YES];
        
    }else if (indexPath.row == 4){
        
        //图片按钮布局类
        BAButtonViewController *vc5 = [BAButtonViewController new];
        [self.navigationController pushViewController:vc5 animated:YES];
        
    }else if (indexPath.row == 5){
     
        //插入图片
        DCLabelViewController *vc6 = [DCLabelViewController new];
        [self.navigationController pushViewController:vc6 animated:YES];
        
    }else if (indexPath.row == 6){
        
        //水波动画
        WaveAnimationViewController *vc7 = [WaveAnimationViewController new];
        [self.navigationController pushViewController:vc7 animated:YES];
    }else if (indexPath.row == 7){
        
        //K 线图
        CandlestickChartTableVC *vc = [CandlestickChartTableVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 8){
        
        //表格效果
        TableViewAnimationController *vc = [TableViewAnimationController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 9){
        
        //国家区号选择表格
        CountrySelectTableVC *vc = [CountrySelectTableVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 10){
        
        //下拉
        PulldownHostVC *vc = [PulldownHostVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 11){
    
        //密码输入框
        InputPassWordVC *vc = [InputPassWordVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 12){
        
        //输入框随行数增加而增加
        InPutVC *vc = [InPutVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 13){
        
        //仿网易左右滑动
        SlipGestureVC *vc = [SlipGestureVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 14){
        
        //弹出框View
        PopUpViewController *vc = [PopUpViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 15){
        
        // 获取图片尺寸
        GetImageSizeVC *vc = [GetImageSizeVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 16){
        
        // 表格头部刷新动画
        LQRefreshViewController *vc = [LQRefreshViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 17){
        
        //类似微博提示框
        ReminderTableVIew *vc = [ReminderTableVIew new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if(indexPath.row == 18){
        
        //点击19 html 应用
        HTMLViewController *vc = [HTMLViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 19){
    
        //点击版本更新
        CheckVersionViewController *vc = [CheckVersionViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 20){
    
        //键盘下移
        KeyBoardViewController *vc = [KeyBoardViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 21){
    
        //城市选择器
        CitySelectTableViewController *vc = [CitySelectTableViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 22){
        
        //人脸识别
        FaceRecognizerVC *vc = [FaceRecognizerVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end


