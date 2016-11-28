

//
//  HTMLViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/11/21.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "HTMLViewController.h"
#import "HTMLSceneOneVC.h"


@interface HTMLViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSArray *_titleArray;

}

@property (weak, nonatomic) IBOutlet UITableView *vTableView;

@end

@implementation HTMLViewController

-(void)viewDidLoad{
    [super viewDidLoad];
  
    [self mInitData];
}

-(void)mInitData{
    _titleArray = @[@"1 - 情形一",@"2 - 情形二",@"3 - 情形三"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _titleArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - cell 点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        HTMLSceneOneVC *vc = [HTMLSceneOneVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
    
        NSLog(@"输出点击了 -- ");
    }
    
}

@end
