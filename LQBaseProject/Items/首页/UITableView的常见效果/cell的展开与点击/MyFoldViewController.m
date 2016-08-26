//
//  MyFoldViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/8/2.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "MyFoldViewController.h"

@interface MyFoldViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *vTableView;
//数据源
@property(nonatomic,strong)NSMutableArray *data;
//开关状态
@property(nonatomic,strong)NSMutableArray *sectionStatus;
//每个区的标题
@property(nonatomic,strong)NSMutableArray *titles;

@end

@implementation MyFoldViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self mInitData];
    [self mInitTableView];
}

//初始化数据
-(void)mInitData{
    
    //trade_noneselect 图片
    NSArray *arr = @[@"分组1",@"分组2",@"分组3",@"分组4"];
    //各个分组的row 显示内容
    self.titles = [[NSMutableArray alloc] initWithArray:arr];
    for (NSString *name in arr) {
        NSMutableArray *rowTitlrArr = [NSMutableArray array];
        for (NSInteger i = 0; i<5; i++) {
            NSString *str = [NSString stringWithFormat:@"%@ + %ld",name,i];
            [rowTitlrArr addObject:str];
        }
        //初始5个分组的展开状态都为0
        [self.sectionStatus addObject:@0];
        //5个大分组的标题数组
        [self.data addObject:rowTitlrArr];
    }
}

-(void)mInitTableView{
    
    [self.vTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //去掉尾部分割线
    self.vTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //分割线偏移
    self.vTableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
    self.vTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //每组根据数组里面保存的展开状态返回row 数
    if ([self.sectionStatus[section] isEqualToNumber:@0]) {
        //是0 是关闭状态
        return 0;
    }
    //展开返回
    NSLog(@"输出展开row数 = %ld",[self.data[section] count]);
    return [self.data[section] count];
}

//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return self.data.count;
}

//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

//组尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

//返回组头的View
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, 44)];
    
    UIButton *sectionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    sectionBtn.frame = CGRectMake(0, 0, kWindowWidth, 44);
    
    //解决@selector不能传值的问题
    sectionBtn.tag = (NSInteger)section;
    
    [sectionBtn setTitle:self.titles[section] forState:UIControlStateNormal];
    
    [sectionBtn addTarget:self action:@selector(sectionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:sectionBtn];
    return headerView;
}

//组头点击
-(void)sectionClick:(UIButton *)btn{
    NSLog(@"输出点击了组头按钮点击的tag = %ld",btn.tag);
    BOOL status = [self.sectionStatus[btn.tag] boolValue];
    
    NSNumber *num = status?@0:@1;
    [_sectionStatus replaceObjectAtIndex:btn.tag withObject:num];
    //重新加载当前区
    [self.vTableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.section][indexPath.row];
    return cell;
    
}

-(NSMutableArray *)data{
    
    if (_data == nil) {
        _data = [[NSMutableArray alloc]init];
    }
    return _data;
}

-(NSMutableArray *)sectionStatus{
    
    if (_sectionStatus == nil) {
        _sectionStatus = [[NSMutableArray alloc]init];
    }
    return _sectionStatus;
}

@end
