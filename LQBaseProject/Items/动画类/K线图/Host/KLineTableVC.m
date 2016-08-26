//
//  KLineTableVC.m
//  LQBaseProject
//
//  Created by YZR on 16/8/12.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "KLineTableVC.h"
#import "KLineTableFirstVC.h"
#import "HtmlKLineVC.h"

@interface KLineTableVC ()

@end

@implementation KLineTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitTableView];
}

-(void)mInitTableView{
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //去掉尾部分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //分割线偏移
    self.tableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - 返回组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

//row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

#pragma mark - 返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"K 线 %ld",indexPath.row];
    
    
    
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            
            KLineTableFirstVC *vc = [KLineTableFirstVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            
            HtmlKLineVC *vc = [HtmlKLineVC new];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        default:
            break;
    }
}


@end
