
//
//  SecondViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "SecondViewController.h"
#import "LanguageChangeVC.h"//语言切换


@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>


//表格
@property (weak, nonatomic) IBOutlet UITableView *vTableView;



@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self mInitUI];
    
    
    [self mInitTableView];



}

-(void)mInitUI{

    self.title = @"富文本";

}

-(void)mInitTableView{
    
    self.vTableView.rowHeight = 35;
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;

}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    return cell;
}


#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        LanguageChangeVC *vc = [LanguageChangeVC new];
        [self.navigationController pushViewController:vc animated:YES];
    
    
    }
}




@end
