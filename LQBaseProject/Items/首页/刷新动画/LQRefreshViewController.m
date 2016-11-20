//  LQRefreshViewController.m
//  LQBaseProject
//  Created by YZR on 16/11/20.
//  Copyright © 2016年 YZR. All rights reserved.


#import "LQRefreshViewController.h"

//刷新动画
#import "MJRefresh.h"
#import "LQRefreshHeader.h"


@interface LQRefreshViewController ()<UITableViewDataSource,UITableViewDelegate>{
}

@property (weak, nonatomic)IBOutlet UITableView *vTableView;

@end

@implementation LQRefreshViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self mInitTableView];
    [self mInitMJRefresh];
}

-(void)mInitTableView{
    
    //self.automaticallyAdjustsScrollViewInsets = NO;//这里如果设置为NO，则刷新效果就没有了
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //去掉尾部分割线
    self.vTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //分割线偏移
    self.vTableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.vTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

-(void)mInitMJRefresh{
    
    //默认【下拉刷新】
    //self.vTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    LQRefreshHeader *header = [LQRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    
    // 设置header
    self.vTableView.mj_header = header;
    
    //默认【上拉加载】
    self.vTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

-(void)loadNewData{
    
    //模拟1秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.vTableView.mj_header endRefreshing];
    });
    
}

-(void)loadMoreData{
    
    
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
