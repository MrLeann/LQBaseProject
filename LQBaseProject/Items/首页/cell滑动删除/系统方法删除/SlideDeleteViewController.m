//
//  SlideDeleteViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/15.
//  Copyright © 2016年 YZR. All rights reserved.
//
/**
 *  这个是用系统的方法，侧滑删除
 *  she
 */


#import "SlideDeleteViewController.h"
#import "SlideDeleteTableCell.h"

@interface SlideDeleteViewController ()<UITableViewDelegate,UITableViewDataSource>{
    

}

@property (weak, nonatomic) IBOutlet UITableView *vTableView;
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation SlideDeleteViewController
{
    NSArray *arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.vTableView registerNib:[UINib nibWithNibName:@"SlideDeleteTableCell" bundle:nil] forCellReuseIdentifier:@"SlideDeleteTableCell"];

    arr = @[@"数据1",@"数据2",@"数据3",@"数据4"];
    [self.dataArray addObjectsFromArray:arr];
}

//数组
-(NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
        
    }
    return _dataArray;
}

#pragma mark - UITableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//row 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *resultCell;
    SlideDeleteTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SlideDeleteTableCell"];
    cell.vTitleLabel.text = self.dataArray[indexPath.row];
    
    //使Cell显示移动按
    cell.showsReorderControl =YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    resultCell = cell;
    return resultCell;
}

#pragma mark - 滑动删除用到的相关协议
//(1)侧滑 - 得先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
    //[self.tableview setEditing:YES animated:YES]; 这个设置也可以
}


//(2)侧滑 - 设置编辑的可删除样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //删除样式
    return UITableViewCellEditingStyleDelete;
}

//(3)侧滑 - 进入编辑模式，按下出现的编辑按钮（删除按钮）后执行
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    //可以统一设置删除类按钮执行事件
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // 1. 更新数据
        [self.dataArray removeObjectAtIndex:indexPath.row];
        
        // 2. 更新UI
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

//(4)侧滑 - 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //这个并且是根据文字长度返回按钮长度的
    return @"谦哥哥";
}







@end
