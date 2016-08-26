//  PulldownRandomVC.m
//  LQBaseProject
//  Created by YZR on 16/8/24.
//  Copyright © 2016年 YZR. All rights reserved.



#import "PulldownRandomVC.h"
#import "LitBtnView.h"
#import "LitBtnSc.h"

@interface PulldownRandomVC ()<UITableViewDelegate,UITableViewDataSource>{
    
     LitBtnSc *lit;

}

@property (weak, nonatomic) IBOutlet UITableView *vTableView;

//点击下拉按钮
@property (weak, nonatomic) IBOutlet UIButton *vPulldownBtn;



@end

@implementation PulldownRandomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.vTableView.rowHeight = 50;
    
    //去掉尾部分割线
    self.vTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //分割线偏移
    self.vTableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.vTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
}

//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    
    return cell;
}

#pragma mark - cell 点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //响应颜色快速消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma mark - 下拉点击
- (IBAction)mPulldownClick:(UIButton *)sender {
    
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];

    lit = [[LitBtnSc alloc] initWithFrame:CGRectMake(20, 155, 100, 40)];
    
    [lit setScColor:[UIColor colorWithRed:255.0f/255.0 green:0 blue:0 alpha:1.0f] btnBackColor:[UIColor colorWithRed:0/255.0 green:255/255 blue:0 alpha:1.0f] btnSelectBackColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:1.0f] btnTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] btnSelectTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] lineColor:[UIColor colorWithRed:0/255.0 green:255/255 blue:255/255 alpha:1.0f]];

    
    [lit setView:self.view arr:arr action:@selector(selectAction:) Alignment:1 selectIndex:0 space:10 font:16 vc:self delegateBtn:self.vPulldownBtn isTap:YES];
    

    
    
    
}

@end





