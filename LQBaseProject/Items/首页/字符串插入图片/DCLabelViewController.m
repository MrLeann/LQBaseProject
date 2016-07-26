//
//  DCLabelViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/21.
//  Copyright © 2016年 YZR. All rights reserved.
//
//网站地址http://my.oschina.net/zhaodacai/blog/652066


#import "DCLabelViewController.h"
#import "DCLabel.h"

@interface DCLabelViewController ()

@property(nonatomic,strong)DCLabel *vTitleLabel;

@end

@implementation DCLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化DCLabel
    self.vTitleLabel = [[DCLabel alloc] initWithFrame:CGRectMake(15, 80, kWindowWidth - 30, 100)];
    self.vTitleLabel.font = [UIFont systemFontOfSize:15.0];
    self.vTitleLabel.numberOfLines = 0;
    self.vTitleLabel.dcAttributedString = @"你想要给自己的账户充值才能继续操作。您可以阅读：如何激活光彩账户了解操作细节。";//要显示的文字
    self.vTitleLabel.textColor = [UIColor blackColor];
    
    //插入图片
    //请务必按顺序使用 // 1:imgSize  2:networkImg||localImg 3:position 4:imgMargin
    self.vTitleLabel.imgSize = CGRectMake(0,0,20,20);
    //    self.vTitleLabel.networkImg = @"http://desk.fd.zol-img.com.cn/t_s960x600c5/g5/M00/05/02/ChMkJ1bxATiIVlzmAAlJIHaXmLkAAOTUgN32YEACUk4716.jpg"; //支持网络
    
    self.vTitleLabel.localImg = [UIImage imageNamed:@"trade_noneselect"];//支持本地图片
    self.vTitleLabel.position = 0;
    self.vTitleLabel.imgMargin = 10;//设置了没什么 效果，不知道有什么用。
    
    [self.view addSubview:self.vTitleLabel];
}




@end
