//
//  SlipViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/10/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "SlipViewController.h"

@interface SlipViewController ()

@end

@implementation SlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //去掉尾部分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //分割线偏移
    self.tableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.title = @"左右滑动效果";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"小码哥-袁峥大神";
    }else{
        cell.textLabel.text = @"其他";
    }
    
    return cell;

}



@end



