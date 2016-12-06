//  SelectProvinceDemoVC.m
//  LQBaseProject
//  Created by YZR on 16/12/3.
//  Copyright © 2016年 YZR. All rights reserved.

#import "SelectProvinceDemoVC.h"
//#import "ProvinceModel.h"

@interface SelectProvinceDemoVC ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    
    //NSArray *_province;//省
    //NSDictionary *_city;//市
    //NSDictionary *_country;//区或县
    
    NSMutableArray *_province;//省
    NSMutableDictionary *_city;//市
    NSMutableDictionary *_country;//区或县
    
    NSMutableArray *_dataArr1;//解析出的  省份
    NSMutableArray *_dataArr2;//解析出的  一级 市
    
    //NSMutableArray
}

@property(nonatomic,strong)NSMutableArray *dataArray;

//@property(nonatomic,strong)UIPickerView *pickerView;//选择器控件

@property (weak, nonatomic) IBOutlet UIPickerView *picker;


@end

@implementation SelectProvinceDemoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _province = [[NSMutableArray alloc] init];
    _city = [NSMutableDictionary dictionaryWithCapacity:10];
    _country = [NSMutableDictionary dictionaryWithCapacity:10];//区或县
    
    _dataArr1 = [[NSMutableArray alloc] init];//一级省份名字数组
    _dataArr2 = [[NSMutableArray alloc] init];//二级市数组
    
    
    self.picker.showsSelectionIndicator = NO;
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    //
    [self mInitUI];
    
    //
    [self mInitData];
    
    //    //省
    //    _province = @[@"北京", @"广西", @"广东"];
    //
    //    //城市
    //    _city = @{
    //              @"北京":@[@"朝阳区", @"东城区", @"西城区"],
    //              @"广西":@[@"桂林市", @"南宁市"],
    //              @"广东":@[@"惠州市", @"广州市", @"深圳市",@"东莞市"]};
    //
    //    //县区
    //    _country = @{
    //                 @"朝阳区":@[@"朝阳区1", @"朝阳区2", @"朝阳区3"],
    //                 @"东城区":@[@"东城区1", @"东城区2",@"东城区3",@"东城区4"],
    //                 @"西城区":@[@"西城区1", @"西城区2", @"西城区3",@"西城区4"],
    //                 @"桂林市":@[@"桂林市1", @"桂林市2", @"桂林市3"],
    //                 @"南宁市":@[@"南宁市1", @"南宁市2",@"南宁市3",@"南宁市4"],
    //                 @"惠州市":@[@"惠州市1", @"惠州市2", @"惠州市3",@"惠州市4"],
    //                 @"广州市":@[@"广州市1", @"广州市2", @"广州市3"],
    //                 @"深圳市":@[@"深圳市1", @"深圳市2",@"深圳市3",@"深圳市4"],
    //                 @"东莞市":@[@"东莞市1", @"东莞市2", @"东莞市3",@"东莞市4"],
    //                 };
    
}

//
-(void)mInitUI{
    self.title = @"城市选择器";
    self.view.backgroundColor = [UIColor whiteColor];
}

// 初始化数据
-(void)mInitData{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"province" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //    NSLog(@"输出读取本地txt = %@",jsonObj);
    
    //此时jsonObj 就是个数组
    //NSArray *arr = jsonObj;
    
    for(id dic in jsonObj){
        
        //ProvinceModel *model = [[ProvinceModel alloc] initWithDic:dic];
        // 省的名字
        NSString *str = dic[@"TextName"];
        [_province addObject:str];
        
        [_dataArr1 addObject:dic[@"ChildCate"]];
        
    }
    
    
    
    //
    //    for(id dic2 in _dataArr1) {
    //
    //        NSString *str = [NSString stringWithFormat:@"%@",dic2[@"TextName"]];
    //        [_dataArr2 addObject:str];
    //
    //    }
    
    
    //
    //    NSLog(@"输出解析出来的%@",_province);
    NSLog(@"解析出来的数组一 = %@",_dataArr1);// 数组
    //    NSLog(@"输出解析出的二级城市数组%@",_dataArr2);
}

#pragma mark - UIPickerViewDataSource
// 该方法的返回值决定该控件包含多少列(必须实现)
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 3;
}

// 返回每列里边的行数（必须实现）
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    // 第一列
    if(0 == component){
        //返回省份列表
        return _province.count;
    }
    
    // 第二列
    if(1 == component) {
        
        //返回市 列表
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        return citys.count;
    }
    
    
    else{
        
        //第三列返回
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSString *cityName = citys[rowCity];
        NSArray *country = _country[cityName];
        return country.count;
    }
}

#pragma mark - UIPickerViewDelegate 协议类
// 设置组件中每行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    //这个方法滚动一次就会执行一次
    if(0 == component){
        
        return _province[row];//省
    }
    
    //
    if(1 == component){
        
        //selectedRowInComponent,用来返回指定列当前选择的行数，0表示选择第一行
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        
        //崩溃点
        return citys[row];
        
    }else{
        
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSString *cityName = citys[rowCity];
        NSArray *country = _country[cityName];
        
        return country[row];
    }
}

// 选中行的事件处, 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if(0 == component){
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
    }
    
    if(1 == component)
        [pickerView reloadComponent:2];
    NSInteger rowOne = [pickerView selectedRowInComponent:0];
    NSInteger rowTow = [pickerView selectedRowInComponent:1];
    NSInteger rowThree = [pickerView selectedRowInComponent:2];
    NSString *provinceName = _province[rowOne];
    NSArray *citys = _city[provinceName];
    NSString *cityName = citys[rowTow];
    NSArray *countrys = _country[cityName];
    NSLog(@"%@~%@~%@", _province[rowOne], citys[rowTow],countrys[rowThree]);
}

//设置组件的宽度
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//    if (component == 0) {
//        return 100;
//    }
//    else
//    {
//        return 80;
//    }
//
//}

////设置组件中每行的高度
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//    if (component == 0) {
//        return 60;
//    }
//    else
//    {
//        return 60;
//    }
//}

#pragma mark - 懒加载类
-(NSMutableArray *)dataArray{
    if(_dataArray == nil){
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end


