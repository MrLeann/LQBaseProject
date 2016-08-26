
//
//  PulldownHostVC.m
//  LQBaseProject
//
//  Created by YZR on 16/8/23.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "PulldownHostVC.h"
#import "PulldownRandomVC.h"


@interface PulldownHostVC (){
    NSArray *_titleArr;

}

@end

@implementation PulldownHostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArr = @[@"1- 任意位置下拉",@"2- 网上",@"3-",@"4-"];
    
    [self mInitTableView];
    
    
}

-(void)mInitTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.rowHeight = 40;
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _titleArr[indexPath.row];
    
    
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.row == 0){
        
        PulldownRandomVC *vc = [PulldownRandomVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        
        
    }else if (indexPath.row == 2){
        
        
    }
}






@end
