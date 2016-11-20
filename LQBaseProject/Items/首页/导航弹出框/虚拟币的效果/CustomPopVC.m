//  CustomPopVC.m
//  LQBaseProject
//  Created by YZR on 16/10/9.
//  Copyright © 2016年 YZR. All rights reserved.

#import "CustomPopVC.h"
#import "DXPopover.h"//视图弹出

@interface CustomPopVC ()<UITableViewDataSource, UITableViewDelegate>{
    CGFloat _popoverWidth;
}

//弹出框点击按钮
@property (weak, nonatomic) IBOutlet UIButton *vPopBtn;
@property (nonatomic, strong) DXPopover *popover;//第三方
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *configs;//表格里面的内容

@end

@implementation CustomPopVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化弹出框
    [self mInitPopover];
    
    //弹出框
    UITableView *blueView = [[UITableView alloc] init];
    blueView.frame = CGRectMake(0, 0, _popoverWidth, 200);//指定高度
    blueView.dataSource = self;
    blueView.delegate = self;
    self.tableView = blueView;
    
    //初始化表格要显示的数据
    self.configs = @[
                     @"1- cha",
                     @"2- Cha",
                     @"3- Cha",
                     @"4- cha",
                     @"5- cha",
                     @"6- cha",
                     @"7- cha"
                     ];
}

//初始化弹出框
-(void)mInitPopover {
    
    self.popover = [DXPopover new];
    _popoverWidth = 200;//弹出框View的宽度

}

#pragma mark - 第一个按钮的点击
-(IBAction)mFristBtnClick:(UIButton *)sender{
    
    [self updateTableViewFrame];
    self.popover.contentInset = UIEdgeInsetsMake(20, 5.0, 20, 5.0);//如果注释掉的话就是没有边框的
    self.popover.backgroundColor = [UIColor whiteColor];
    
    //导航上的View，即弹出框是要添加
    //UIView *titleView = self.navigationItem.titleView;
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.vPopBtn.frame), CGRectGetMaxY(self.vPopBtn.frame)+10);//弹出框在屏幕的初始位置
    [self.popover showAtPoint:startPoint
               popoverPostion:DXPopoverPositionDown
              withContentView:self.tableView
                       inView:self.view];//初始值
    
    //这个只是一个视图消失后按按点击的放大动画，是此View的整体View放大
    __weak typeof(self) weakSelf = self;
    self.popover.didDismissHandler = ^{
        [weakSelf bounceTargetView:weakSelf.view];
    };
    
}

#pragma mark - 按钮动画偏移
-(void)bounceTargetView:(UIView *)targetView{
    
    targetView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    
    [UIView animateWithDuration:0.5
                          delay:0.0
         usingSpringWithDamping:0.3
          initialSpringVelocity:5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         targetView.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
    
    
}

-(void)updateTableViewFrame {
    CGRect tableViewFrame = self.tableView.frame;
    tableViewFrame.size.width = _popoverWidth;
    self.tableView.frame = tableViewFrame;
    self.popover.contentInset = UIEdgeInsetsZero;
    self.popover.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 弹出框协议相关
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.configs.count;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.configs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"输出选中的行数");
}


@end



