//  XBHostViewController.m
//  LQBaseProject
//  Created by YZR on 16/10/8.
//  Copyright © 2016年 YZR. All rights reserved.


#import "XBHostViewController.h"
#import "XBFirstViewController.h"
#import "XBSecondViewController.h"
#import "XBThirdViewController.h"
#import "XBFourthViewController.h"
#import "XBFifthViewController.h"

@interface XBHostViewController ()<UIScrollViewDelegate>{
    UIView *netView;
    NSInteger netIndex;
}

@property (nonatomic, strong)UIScrollView *titleScrollView;//标题的ScrollView
@property (nonatomic, strong)UIScrollView *contentScrollView;//作为容器的ScrollView
@property (nonatomic, strong)UIView *slider;//导航下标条View
@property (nonatomic, assign)NSInteger index;
@property (nonatomic, assign)CGPoint beginOffset;//拖拽开始的偏移量
@property (nonatomic, strong)NSMutableArray *titleArr;//存放标题的数组
@property (nonatomic, assign)NSInteger currenIndex;//

@end

@implementation XBHostViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitUI];
    
    [self mInitScrollView];//scrollView相关设置
}

#pragma mark - 初始化UI
-(void)mInitUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setTitle:@"列表"];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - 标题scrollview懒加载
-(UIScrollView *)titleScrollView{
    
    if(_titleScrollView == nil){
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kWindowWidth, 40)];
        _titleScrollView.backgroundColor = [UIColor whiteColor];//透明颜色
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        _titleScrollView.showsVerticalScrollIndicator = YES;
        
        // 下标条
        self.slider = [[UIView alloc] initWithFrame:CGRectMake(5, 40-2, kWindowWidth/4 - 10, 2)];
        self.slider.backgroundColor = [UIColor redColor];
        self.slider.tag = 10001;
        self.slider.hidden = YES;
        [_titleScrollView addSubview:self.slider];//下标条是添加到scrollview里面的什么👻
    }
    return _titleScrollView;
}

#pragma mark - 懒加载 内容ScrollView
//这个是有遵守协议的，标题的scrollview 是没有遵守的
-(UIScrollView *)contentScrollView{
    
    if (_contentScrollView == nil){
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kWindowWidth, kWindowHeight - 64)];
        _contentScrollView.pagingEnabled = YES;//翻页效果
        _contentScrollView.backgroundColor = [UIColor whiteColor];
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsVerticalScrollIndicator = YES;
        _contentScrollView.bounces = NO;//是否回弹
        
        //默认如果不设置contentSize,scrollView是没有回弹效果的,可是如果设置了`的情况下,水平和垂直方向就都有了回弹效果，这个设置没效果
        //_contentScrollView.alwaysBounceVertical = NO;
        //_contentScrollView.alwaysBounceHorizontal = NO;
        
        _contentScrollView.delegate = self;
    }
    return _contentScrollView;
}

#pragma mark - 标题scrollView的相关设置
-(void)mInitScrollView{
    
    // *** 1、标题的scrollView设置 ***
    CGFloat itemWidth = kWindowWidth/4;
    NSArray *vTitleArr = @[@"测试1",@"测试2",@"测试3",@"测试4",@"测试5"];
    self.titleArr = [NSMutableArray arrayWithArray:vTitleArr];
    //NSLog(@"输出标题数组 titleArr = %@",vTitleArr);
    for (int i=0; i< self.titleArr.count;i++){
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(itemWidth*i, 0, itemWidth, 40)];//这儿其实已经就固定了其一行显示的个数，每个标题的宽度也是固定的
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = self.titleArr[i];
        label.tag = 100 + i;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleDidTap:)];
        [label addGestureRecognizer:tapGesture];
        label.userInteractionEnabled = YES;
        [self.titleScrollView addSubview:label];
    }
    
     _titleScrollView.contentSize = CGSizeMake(itemWidth * self.titleArr.count, 40);
    //NSLog(@"输出self.titleArr标题个数 = %zd",self.titleArr.count);//有输出5个
    
    /*
     *     2、内容的 scrollView  ***
     */
    self.contentScrollView.contentSize = CGSizeMake(kWindowWidth * self.titleArr.count, self.view.bounds.size.height - 64 - 40);
    self.slider.hidden = NO;
    
    //[self scrollViewDidScroll:self.contentScrollView];//没意义
    //设置标题内容
    [self.titleScrollView setContentOffset:CGPointMake(kWindowWidth/4* ([Singleton shared].activeIndex ), 0) animated:YES];
    [self.contentScrollView setContentOffset:CGPointMake(kWindowWidth*([Singleton shared].activeIndex), 0) animated:YES];
    [self.view addSubview:self.contentScrollView];
    [self.view addSubview:self.titleScrollView];
    
    //视图初始化
    [self mAddVC:[[XBFirstViewController alloc] initWithNibName:@"XBFirstViewController" bundle:nil]];
    [self mAddVC:[[XBSecondViewController alloc] initWithNibName:@"XBSecondViewController" bundle:nil]];
    [self mAddVC:[[XBThirdViewController alloc] initWithNibName:@"XBThirdViewController" bundle:nil]];
    [self mAddVC:[[XBFourthViewController alloc] initWithNibName:@"XBFourthViewController" bundle:nil]];
    [self mAddVC:[[XBFifthViewController alloc] initWithNibName:@"XBFifthViewController" bundle:nil]];
}

#pragma mark - 统一添加视图控制器
-(void)mAddVC:(UIViewController *)vc{
    
    [self addChildViewController:vc];//这个？
    [self.contentScrollView addSubview:vc.view];//这个，额..??
    [vc didMoveToParentViewController:self];//这个,
    CGSize size = self.contentScrollView.bounds.size;
    vc.view.frame = CGRectMake(self.currenIndex * size.width, 0, size.width, size.height);
    self.currenIndex ++;
}

#pragma mark - 开始拖拽
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // 求得移动的距离
    NSInteger currentIndex = self.beginOffset.x / self.titleScrollView.bounds.size.width;
    UILabel *nextTitleLabel = nil;
    
    // 往右滚动
    if (scrollView.contentOffset.x > self.beginOffset.x){
        nextTitleLabel = (UILabel *)[self.titleScrollView viewWithTag:currentIndex+1+100];
    }
    
    //往左滚动
    if (scrollView.contentOffset.x < self.beginOffset.x){
        nextTitleLabel = (UILabel *)[self.titleScrollView viewWithTag:currentIndex-1+100];
    }
    
    //self.hidenView.hidden = YES;
    for(id obj in self.titleScrollView.subviews){
        
        //遍历View
        if ([obj isKindOfClass:[UILabel class]]){
            
            UILabel* label = (UILabel*)obj;
            if (label.tag == scrollView.contentOffset.x/kWindowWidth + 100) {
                
                label.textColor = [UIColor redColor];
                for (id obj in self.titleScrollView.subviews)  {
                    //遍历View
                    if ([obj isKindOfClass:[UILabel class]]) {
                        UILabel* theButton = (UILabel*)obj;
                        if (theButton != label) {
                            theButton.textColor = [UIColor blackColor];
                        }
                    }
                }
            }
        }
    }
}

#pragma mark - 快要停止拖拽的时候开始执行
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"输出 --- 减速快要停止 ---");
    NSInteger currentIndex = scrollView.contentOffset.x / self.titleScrollView.bounds.size.width;
    UILabel *label = (UILabel *)[self.titleScrollView viewWithTag:currentIndex + 100];
    //滚动到让指定的rect可见
    [self.titleScrollView scrollRectToVisible:label.frame animated:YES];
    self.slider = [self.titleScrollView viewWithTag:10001];
    [UIView animateWithDuration:0.1 animations:^{
        self.slider.center = CGPointMake(label.center.x, self.slider.center.y);
    } completion:nil];
}

#pragma mark - Event Handlers
- (void)titleDidTap:(UITapGestureRecognizer *)tap{
    NSLog(@" --输出标题点击响应-- ");
    NSInteger index = tap.view.tag - 100;
    [self.titleScrollView scrollRectToVisible:tap.view.frame animated:YES];
    [self.contentScrollView setContentOffset:CGPointMake(kWindowWidth * index, 0) animated:YES];
    for (id obj in self.titleScrollView.subviews)  {  //遍历View
        if ([obj isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)obj;
            if (label.tag == index + 100){
                label.textColor = [UIColor redColor];
            }else  label.textColor = [UIColor blackColor];
        }
    }
    self.slider = [self.titleScrollView viewWithTag:10001];
    [UIView animateWithDuration:0.1 animations:^{
        self.slider.center = CGPointMake(tap.view.center.x, self.slider.center.y);
    } completion:nil];
}

-(NSMutableArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = [[NSMutableArray alloc]init];
        
    }
    return _titleArr;
}

@end

/*
 * 苹果新的API增加了addChildViewController方法，
 * 并且希望我们在使用addSubview时，同时调用[self addChildViewController:child]方法将sub view对应的viewController也加到当前ViewController的管理中。
 * 对于那些当前暂时不需要显示的subview，只通过addChildViewController把subViewController加进去；
 * 需要显示时再调用transitionFromViewController方法。将其添加进入底层的ViewController中。
 * 这样做的好处：
 1.无疑，对页面中的逻辑更加分明了。相应的View对应相应的ViewController。
 2.当某个子View没有显示时，将不会被Load，减少了内存的使用。
 3.当内存紧张时，没有Load的View将被首先释放，优化了程序的内存释放机制。
 */

/*
 *  在iOS 5中，ViewController中新添加了下面几个方法：
 *  addChildViewController:
 *  removeFromParentViewController
 *  transitionFromViewController:toViewController:duration:options:animations:completion:
 *  willMoveToParentViewController:
 *  didMoveToParentViewController:
 */