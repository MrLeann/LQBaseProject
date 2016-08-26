//
//  TableViewAnimationController.m
//  LQBaseProject
//
//  Created by YZR on 16/8/1.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "TableViewAnimationController.h"
#import "MyFoldViewController.h"//tableView的折叠效果

@interface TableViewAnimationController (){
    NSArray *titleArray;
}

@end

@implementation TableViewAnimationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    titleArray = @[@"1 - cell点击展开与关闭",@"2 - ",@"3 - "];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 100;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = titleArray[indexPath.row];
    
    //点击无色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        MyFoldViewController *vc = [MyFoldViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
