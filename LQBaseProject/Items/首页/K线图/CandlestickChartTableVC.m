//
//  CandlestickChartTableVC.m
//  LQBaseProject
//
//  Created by YZR on 16/7/30.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "CandlestickChartTableVC.h"
#import "TimeShareVC.h"
#import "CandleVC.h"//蜡烛图


@interface CandlestickChartTableVC (){
    
    NSArray *_titleArr;
    
}

@end

@implementation CandlestickChartTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArr = @[@"1 - 分时图",@"2-蜡烛图",@"3- ",@"4- "];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

#pragma mark - cell 点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[TimeShareVC new] animated:YES];
        
    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[CandleVC new] animated:YES];
    
    }else if (indexPath.row == 2){
        
        NSLog(@"输出点击了第三个");
    }
    
}


@end

