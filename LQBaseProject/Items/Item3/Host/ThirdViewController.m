//
//  ThirdViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/7.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIBezierPathVC.h"//绘制类

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_titleArray;

}

@property (weak, nonatomic) IBOutlet UITableView *vTableView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = @[@"UIBezierPath画图",@"----",@"----",@"---",@"---",@"---",@"---",@"---"];
    
    [self mInitUI];
    [self mInitTableView];
}


-(void)mInitUI{



}

-(void)mInitTableView{
    
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行,%@",indexPath.row,_titleArray[indexPath.row]];
    
    //返回cell里面，点击无色设置
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - cell 点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIBezierPathVC *vc = [UIBezierPathVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        
    
    }
}




@end




