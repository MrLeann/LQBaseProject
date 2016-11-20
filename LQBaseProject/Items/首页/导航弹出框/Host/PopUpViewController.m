//
//  PopUpViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/10/9.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "PopUpViewController.h"
#import "CustomPopVC.h"


@interface PopUpViewController (){
    NSArray *_titleArr;
}

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _titleArr = @[@"1- 虚拟币效果1",@"2- ",@"3 - "];
    
    [self mInitTableView];
}

-(void)mInitTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.textLabel.textColor = kBlackColor;
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        //虚拟币的效果
        CustomPopVC *vc = [CustomPopVC new];
        [self.navigationController pushViewController:vc animated:YES];
    
    }else if (indexPath.row == 1){
    
        
    }
    
}

@end



