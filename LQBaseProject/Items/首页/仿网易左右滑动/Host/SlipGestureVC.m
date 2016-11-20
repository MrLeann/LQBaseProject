//
//  SlipGestureVC.m
//  LQBaseProject
//
//  Created by YZR on 16/10/8.
//  Copyright © 2016年 YZR. All rights reserved.


#import "SlipGestureVC.h"
#import "XBHostViewController.h"
#import "HMTMainViewController.h"//网上的仿网易效果图

@interface SlipGestureVC ()<UITableViewDataSource,UITableViewDelegate>{

    NSArray *_titleArr;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SlipGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _titleArr = @[@"1- 小码哥-袁峥大神",@"2- 心博网效果",@"3- 网上仿网易效果",@"4- "];
    [self mInitTableView];
}

-(void)mInitTableView{
    //去掉尾部分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //分割线偏移
    self.tableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.title = @"左右滑动";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //返回cell里面，点击无色设置
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"输出cell的点击行数 = %zd",indexPath.row);
    if (indexPath.row == 0) {
        //小码哥，袁峥
        
    }else if (indexPath.row == 1){
        
        //心博网
        XBHostViewController *vc = [[XBHostViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if(indexPath.row == 2){
        
        //网上仿网易效果
        HMTMainViewController *vc = [[HMTMainViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}


@end


