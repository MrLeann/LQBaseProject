//  HMTMainViewController.m
//  LQBaseProject
//  Created by YZR on 16/10/8.
//  Copyright © 2016年 YZR. All rights reserved.
/*
    1、这是一个渐变的效果Demo，不是类似网易的滑动切换效果
    2、点击最后几个后退回点击前面的几个按钮，程序会奔溃
 */

#import "HMTMainViewController.h"
#import "HMTFirstViewController.h"//1.
#import "HMTSecondViewController.h"//2.
#import "HMTThirdViewController.h"//3.

@interface HMTMainViewController ()<UIScrollViewDelegate>

@property (nonatomic ,strong) HMTFirstViewController *firstVC;
@property (nonatomic ,strong) HMTSecondViewController *secondVC;
@property (nonatomic ,strong) HMTThirdViewController *thirdVC;

@property (nonatomic ,strong) UIViewController *currentVC;
@property (nonatomic ,strong) UIScrollView *headScrollView;//顶部滚动视图
@property (nonatomic ,strong) NSArray *headArray;

@end

@implementation HMTMainViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitUI];
}

-(void)mInitUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"网易新闻";
    self.headArray = @[@"头条",@"娱乐",@"体育资讯",@"财经",@"科技",@"NBA",@"手机"];
    self.headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kWindowWidth, 40)];
    self.headScrollView.backgroundColor = [UIColor purpleColor];
    self.headScrollView.contentSize = CGSizeMake((kWindowWidth/4)*self.headArray.count, 40);
    self.headScrollView.bounces = YES;
    self.headScrollView.pagingEnabled = NO;
    self.headScrollView.showsVerticalScrollIndicator = NO;
    self.headScrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.headScrollView];
    for (int i = 0; i < [self.headArray count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + i*(kWindowWidth/4), 0, kWindowWidth/4, 40);
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = i + 100;
        [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headScrollView addSubview:button];
    }
    
    self.firstVC = [[HMTFirstViewController alloc] init];
    [self.firstVC.view setFrame:CGRectMake(0, 104, kWindowWidth, 464)];
    [self addChildViewController:_firstVC];
    
    self.secondVC = [[HMTSecondViewController alloc] init];
    [self.secondVC.view setFrame:CGRectMake(0, 104, kWindowWidth, 464)];
    
    self.thirdVC = [[HMTThirdViewController alloc] init];
    [self.thirdVC.view setFrame:CGRectMake(0, 104, kWindowWidth, 464)];
    
    //默认,第一个视图(你会发现,全程就这一个用了addSubview)
    [self.view addSubview:self.firstVC.view];
    self.currentVC = self.firstVC;
}

- (void)didClickHeadButtonAction:(UIButton *)button{
    
    //点击处于当前页面的按钮,直接跳出
    if ((self.currentVC == self.firstVC && button.tag == 100)||(self.currentVC == self.secondVC && button.tag == 101.)) {
        return;
    }else{
        
        //展示2个,其余一样,自行补全噢
        switch (button.tag) {
            case 100:
                [self replaceController:self.currentVC newController:self.firstVC];
                break;
            case 101:
                [self replaceController:self.currentVC newController:self.secondVC];
                break;
            case 102:
                
                [self replaceController:self.currentVC newController:self.thirdVC];
                
                break;
            case 103:
                [self replaceController:self.currentVC newController:self.firstVC];
                break;
            case 104:
                [self replaceController:self.currentVC newController:self.secondVC];
                break;
            case 105:
                [self replaceController:self.currentVC newController:self.thirdVC];
                break;
            case 106:
                [self replaceController:self.currentVC newController:self.secondVC];
                
                break;
            default:
                break;
        }
    }
}


//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController{
    
    /**
     *  着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:2.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }else{
            
            self.currentVC = oldController;
            
        }
    }];
}

@end
