//  SecondarySelectCityVC.m
//  LQBaseProject
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.


#import "SecondarySelectCityVC.h"
#import "SelectDistrictView.h"//地区选择


@interface SecondarySelectCityVC ()

//选择的按钮
@property (weak, nonatomic) IBOutlet UIButton *vSelectButton;

@end

@implementation SecondarySelectCityVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitData];
    
    
}

//初始化数据
-(void)mInitData{
    
}

#pragma mark - 城市选择
- (IBAction)mSecondaryClick:(UIButton *)sender{

    // 城市选择器
    SelectDistrictView *city = [[SelectDistrictView alloc] initWithDistrictView:self.view.bounds selectTitle:@"选择地区"];
    
    // 回调
    __weak typeof(self)blockself = self;
    [city showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *distr){
        
        if ([proviceStr isEqualToString:cityStr]) {
            //省市相同，显示一个
            blockself.vSelectButton.titleLabel.text = [NSString stringWithFormat:@"%@",proviceStr];
        }else{
            
            //不同则都显示
            blockself.vSelectButton.titleLabel.text = [NSString stringWithFormat:@"%@ - %@",proviceStr,cityStr];
        }
    }];
    
}

@end
