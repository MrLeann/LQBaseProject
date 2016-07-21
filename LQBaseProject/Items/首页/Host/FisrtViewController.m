

//
//  FisrtViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "FisrtViewController.h"
#import "TwoDimensionCodeViewController.h"
#import "CreateCodeTableViewController.h"//二维码生成
#import "SlideDeleteViewController.h"//cell滑动删除
#import "GestureTableViewController.h"//手势解锁
#import "BAButtonViewController.h"//图片按钮布局

@interface FisrtViewController ()<UITableViewDelegate,UITableViewDataSource>{


}

//表格控件
@property (weak, nonatomic) IBOutlet UITableView *vTableView;
@property(nonatomic,strong)NSArray *listTitleArr;


@end

@implementation FisrtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mTableViewSetting];
    
}

-(void)mTableViewSetting{
    
    //去掉尾部分割线
    self.vTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //分割线偏移
    self.vTableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.vTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.listTitleArr = @[@"1 - 二维码扫描",@"2 - 二维码生成",@"3 -cell滑动删除 ",@"4 -手势解锁",@"5 -图片按钮布局",@"6 -****",@"7 -****",@"8 -*****"];
    
    self.vTableView.rowHeight = 60;
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
        SlideDeleteViewController *vc = [SlideDeleteViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        GestureTableViewController *vc = [GestureTableViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        //图片按钮布局类
        BAButtonViewController *vc = [BAButtonViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
