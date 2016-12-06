//  SelectDistrictView.m
//  LQBaseProject
//  Created by YZR on 16/12/6.
//  Copyright © 2016年 YZR. All rights reserved.

#import "SelectDistrictView.h"
#import "ProvinceModel.h"//模型

#define TWW self.frame.size.width   //屏幕 宽度
#define TWH self.frame.size.height  //屏幕 高度

#define TWRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define BtnW  60
#define toolH  40
#define BJH  260


@interface SelectDistrictView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    
    
    UIView *_BJView;//一个view，工具栏和pickview都是添加到上面，便于管理
    NSString *_provinceName;//省份
    NSString *_cityName;//城市名
    
    UIPickerView *_pickView;// 最主要的选择器
}

@property (copy, nonatomic) void (^sele)(NSString *proviceStr,NSString *cityStr,NSString *distr);


@property (nonatomic, strong)NSArray *provinces;

@end

@implementation SelectDistrictView

-(instancetype)initWithDistrictView:(CGRect)rect selectTitle:(NSString *)title{

    if(self = [super initWithFrame:rect]) {
        
        //蒙版效果
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];//白色的背景View
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        }];
    
        // 显示pickview和按钮最底下的view
        _BJView = [[UIView alloc] initWithFrame:CGRectMake(0, TWH, TWW, BJH)];
        [self addSubview:_BJView];
        
        UIView *tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, TWW, toolH)];
        tool.backgroundColor = TWRGB(237, 236, 234);
        [_BJView addSubview:tool];
        
        // 按钮+中间可以显示标题的UILabel
        UIButton *left = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        left.frame = CGRectMake(0, 0, BtnW, toolH);
        [left setTitle:@"取消" forState:UIControlStateNormal];
        [left addTarget:self action:@selector(leftBTN) forControlEvents:UIControlEventTouchUpInside];
        [tool addSubview:left];
        
        UILabel *titleLB = [[UILabel alloc] initWithFrame:CGRectMake(left.frame.size.width, 0, TWW-(left.frame.size.width*2), toolH)];
        titleLB.text = title;
        titleLB.textAlignment = NSTextAlignmentCenter;
        [tool addSubview:titleLB];
        
        UIButton *right = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        right.frame = CGRectMake(TWW-BtnW ,0,BtnW, toolH);
        [right setTitle:@"确定" forState:UIControlStateNormal];
        [right addTarget:self action:@selector(rightBTN) forControlEvents:UIControlEventTouchUpInside];
        [tool addSubview:right];
        
        // 滚筒选择器
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,toolH, TWW, _BJView.frame.size.height-toolH)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = TWRGB(237, 237, 237);
        [_BJView addSubview:_pickView];
        
        
        //初始选择
         [self pickerView:_pickView didSelectRow:0 inComponent:0];
        
    }
    return self;
    
}


-(NSArray *)provinces{
    
    if (_provinces == nil) {
        
        // 获取plist文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil];
        
        // 加载plist文件的内容到数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        // 数组转模型
        for (NSDictionary *dict in dictArray) {
            ProvinceModel *province = [ProvinceModel provinceWithDict:dict];
            
            [tempArray addObject:province];
        }
        
        _provinces = tempArray;
    }
    
    return _provinces;
}

#pragma mark - 自定义每个pickview的label
-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    //
    UILabel* pickerLabel = [UILabel new];
    pickerLabel.numberOfLines = 0;
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    [pickerLabel setFont:[UIFont boldSystemFontOfSize:13]];
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;

}

#pragma mark -数据源方法
/**
 *  pickerView共有多少列
 */
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

/**
 *  pickerView第component列有多少行
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (0 == component) {
        
        return self.provinces.count;
    }
    
    // 获得第0列当前选中的行号
    //    int zeroRow = [self.pickerView selectedRowInComponent:0];
    NSInteger zeroRow = [_pickView selectedRowInComponent:0];
    
    
    // 根据行号确定省份
    ProvinceModel *province = self.provinces[zeroRow];
    // 根据省份确定第1列城市的数量
    return province.cities.count;
    
}

#pragma mark -代理方法
/**
 *  pickerView第component列的第row行显示的字符串
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    if (0 == component) {
        ProvinceModel *province = self.provinces[row];
        return province.name;
    }
    
    // 获得第0列当前选中的行号
    NSInteger zeroRow = [_pickView selectedRowInComponent:0];
    
    // 根据行号确定省份
    ProvinceModel *province = self.provinces[zeroRow];
    
    // 根据省份确定第1列要显示的城市
    return province.cities[row];
    
}

/**
 *  当选中了pickerView的第component列的第row行会调用这个方法
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    // 如果第0列有变化，就要刷新第1列的数据，并且让第1列选中第0行
    if (0 == component) {
        // 刷新第1列(因为第1列是根据第0列显示的省份来显示不同的城市)
        [_pickView reloadComponent:1];
        
        [_pickView selectRow:0 inComponent:1 animated:YES];
    }
    
    // 获得第0列当前选中的行号
    NSInteger zeroRow = [_pickView selectedRowInComponent:0];
    // 根据行号确定省份
    ProvinceModel *province = self.provinces[zeroRow];
    // 获取省份名
    _provinceName = province.name;
    
    // 获得第1列当前选中的行号
    NSInteger firstRow = [_pickView selectedRowInComponent:1];
    // 根据行号获取城市名
    _cityName = province.cities[firstRow];
    
    
    // ----  最后输出结果 -----
//    self.provinceAndCityLabel.text = [NSString stringWithFormat:@"%@--%@", _provinceName, _cityName];


}

#pragma mark - UI布局相关
/**
 *  左边的取消按钮
 */
-(void)leftBTN{
    __weak typeof(UIView*)blockview = _BJView;
    __weak typeof(self)blockself = self;
    __block int blockH = TWH;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect bjf = blockview.frame;
        bjf.origin.y = blockH;
        blockview.frame = bjf;
        blockself.alpha = 0.1;
    } completion:^(BOOL finished) {
        [blockself removeFromSuperview];
    }];
    
}

/**
 *  右边的确认按钮
 */
-(void)rightBTN{
    
    __weak typeof(UIView*)blockview = _BJView;
    __weak typeof(self)blockself = self;
    __block int blockH = TWH;
    if(self.sele){
        self.sele(_provinceName,_cityName,@"");
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect bjf = blockview.frame;
        bjf.origin.y = blockH;
        blockview.frame = bjf;
        blockself.alpha = 0.1;
    } completion:^(BOOL finished) {
        [blockself removeFromSuperview];
    }];
}

#pragma mark - 展示 城市的View
-(void)showCityView:(void (^)(NSString *, NSString *, NSString *))selectStr{
    
    self.sele = selectStr;
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    __weak typeof(UIView*)blockview = _BJView;
    __block int blockH = TWH;
    __block int bjH = BJH;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect bjf = blockview.frame;
        bjf.origin.y = blockH-bjH;
        blockview.frame = bjf;
    }];
}

// 屏幕点击事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(_BJView.frame, point)) {
        [self leftBTN];
    }
}



@end
