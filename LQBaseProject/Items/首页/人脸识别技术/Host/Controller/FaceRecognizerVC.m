//  FaceRecognizerVC.m
//  LQBaseProject
//  Created by YZR on 16/12/8.
//  Copyright © 2016年 YZR. All rights reserved.

#import "FaceRecognizerVC.h"
#import "FaceClipVC.h"// 人脸截取
#import "GetFaceDataViewController.h"//脸部数据获取

@interface FaceRecognizerVC(){
    
    NSArray *_titleArray;
}

@end

@implementation FaceRecognizerVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitData];
}

-(void)mInitData{
    
    //
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleArray = @[@"1- 人脸截取",@"2 - 脸部数据获取",@"3 ",@"4 - "];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        //脸部截取
        FaceClipVC *vc = [FaceClipVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
        
        //脸部分析
        GetFaceDataViewController *vc = [GetFaceDataViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        
        //
//        DateSelectVC *vc = [DateSelectVC new];
//        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 3){
        
    }
}

@end
