//  CitySelectTableViewController.m
//  LQBaseProject
//  Created by YZR on 16/12/3.
//  Copyright © 2016年 YZR. All rights reserved.

#import "CitySelectTableViewController.h"
#import "SelectProvinceDemoVC.h"
#import "SecondarySelectCityVC.h"//


@interface CitySelectTableViewController (){
    NSArray *_titleArray;
    
    
}

@end

@implementation CitySelectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitData];
}

-(void)mInitData{
    
    //
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleArray = @[@"1- Josn数据",@"2 - 二级联动Demo",@"3 - ",@"4 - "];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //
    cell.textLabel.text = _titleArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        
        SelectProvinceDemoVC *vc = [SelectProvinceDemoVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        SecondarySelectCityVC *vc = [SecondarySelectCityVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
    
        
        
    }else if (indexPath.row == 3){
        
        
        
    }
}

@end


