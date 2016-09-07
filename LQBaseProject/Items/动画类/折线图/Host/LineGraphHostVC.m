

//
//  LineGraphHostVC.m
//  LQBaseProject
//
//  Created by YZR on 16/9/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LineGraphHostVC.h"
#import "LineGraphVC.h"


@interface LineGraphHostVC (){

    NSArray *_titleArray;
}

@end

@implementation LineGraphHostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = @[@"1 - 折线图",@"2 - 折线图",@"3 - 折线图"];
    
    self.tableView.rowHeight = 45;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return 5;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13.0];
    
    return cell;
}

#pragma mark - 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        
        LineGraphVC *vc = [LineGraphVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
    
        
    
    }
}


@end
