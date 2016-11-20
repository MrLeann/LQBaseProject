//  ReminderTableVIew.m
//  LQBaseProject
//  Created by YZR on 16/10/9.
//  Copyright © 2016年 YZR. All rights reserved.

#import "ReminderTableVIew.h"
#import "ReminderSceneOneVC.h"

@interface ReminderTableVIew (){
    NSArray *_titleArray;
    
}

@end

@implementation ReminderTableVIew

-(void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.title = @"类似微博提示框";
    
    _titleArray = @[@"1- 情形一",@"2- 情形二"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

#pragma mark - 选中cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.row == 0){
        
        ReminderSceneOneVC *vc = [ReminderSceneOneVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        
    }
}



@end
