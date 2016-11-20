//
//  CountrySelectTableVC.m
//  LQBaseProject
//
//  Created by YZR on 16/8/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "CountrySelectTableVC.h"
#import "CountrySelectFirstVC.h"
#import "EVTPhoneAreaCodeViewController.h"//



@interface CountrySelectTableVC ()

@end

@implementation CountrySelectTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

//返回组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"自定义";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"中文选择";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"英文选择";
    }
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        CountrySelectFirstVC *vc = [CountrySelectFirstVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        
        //中文
        EVTPhoneAreaCodeViewController *vc = [[EVTPhoneAreaCodeViewController alloc]init];
        vc.completion = ^(NSString *name, NSString *code){
            
            NSLog(@"输出回调的文字 = %@",[NSString stringWithFormat:@"+%@ %@",code,name]);
            //            [b setTitle:[NSString stringWithFormat:@"+%@ %@",code,name] forState:UIControlStateNormal];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        
        //国际化
        EVTPhoneAreaCodeViewController *vc = [[EVTPhoneAreaCodeViewController alloc]init];
        vc.localeEn = YES;
        vc.completion = ^(NSString *name, NSString *code){
//            UIButton *b = sender;
//            [b setTitle:[NSString stringWithFormat:@"+%@ %@",code,name] forState:UIControlStateNormal];
            
            //有回调
        };
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
    }
}

@end
