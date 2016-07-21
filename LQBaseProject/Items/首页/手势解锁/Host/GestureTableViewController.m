//
//  GestureTableViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/16.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "GestureTableViewController.h"
#import "HandLockVC.h"

@interface GestureTableViewController (){
    NSArray *titleArr;
}

@end

@implementation GestureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleArr = @[@"谭灿手势",@"其他手势"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = titleArr[indexPath.row];
    //返回cell里面，点击无色设置
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        HandLockVC *vc = [HandLockVC new];
        [self presentViewController:vc animated:YES completion:^{
        }];
    }

}




@end
