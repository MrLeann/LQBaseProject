//
//  1. 先导入3个头文件
//     #import "LXDScanView.h"
//     #import "LXDScanCodeController.h"
//     #import <AVFoundation/AVFoundation.h>
//  2. 遵守2个协议LXDScanViewDelegate, LXDScanCodeControllerDelegate

/**
 *   1.直接扫描是此界面创建一个View对象
 *   2.跳转是
 *      
 *   注：此Demo会一段时间会崩溃，目前找不到原因
 */


#import "LXDTwoDimensionCodeVC.h"
#import "LXDScanView.h"
#import "LXDScanCodeController.h"
#import <AVFoundation/AVFoundation.h>


@interface LXDTwoDimensionCodeVC ()<LXDScanViewDelegate, LXDScanCodeControllerDelegate>

@property (nonatomic, strong) LXDScanView * scanView;

@end

@implementation LXDTwoDimensionCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}


#pragma mark - getter
/**
 *  懒加载扫描view
 */
- (LXDScanView *)scanView
{
    if (!_scanView) {
        _scanView = [LXDScanView scanViewShowInController: self];
    }
    return _scanView;
}


#pragma mark - LXDScanViewDelegate
/**
 *  返回扫描结果
 */
- (void)scanView:(LXDScanView *)scanView codeInfo:(NSString *)codeInfo
{
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}


#pragma mark - LXDScanCodeControllerDelegate
- (void)scanCodeController:(LXDScanCodeController *)scanCodeController codeInfo:(NSString *)codeInfo
{
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}


#pragma mark - 直接扫描
- (IBAction)mcurrentScanCLick:(UIButton *)sender {
    
    [self.view addSubview: self.scanView];
    [self.scanView start];
    
}

#pragma mark - 跳转扫描
- (IBAction)mPushScanClick:(UIButton *)sender {
    
    [self.scanView removeFromSuperview];
    LXDScanCodeController * scanCodeController = [LXDScanCodeController scanCodeController];
    scanCodeController.scanDelegate = self;
    [self.navigationController pushViewController: scanCodeController animated: YES];
    
}

#pragma mark - 视图消失 - 停止扫描
- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear: animated];
    [self.scanView stop];
}

#pragma mark - dealloc 消失
- (void)dealloc{
    
    [self.scanView stop];
}

@end
