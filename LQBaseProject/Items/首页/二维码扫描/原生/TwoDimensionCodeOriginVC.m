/**
 *   来自宏创学院
 *   1. 首先添加库AVFoundation；
 *   2. 协议AVCaptureMetadataOutputObjectsDelegate
 *   3. 协议方法
 *   注明：模拟器点击进来会崩溃，手机上不会
 */

#import "TwoDimensionCodeOriginVC.h"
#import <AVFoundation/AVFoundation.h>//二维码扫描
#import "WebViewController.h"

@interface TwoDimensionCodeOriginVC ()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic,strong) AVCaptureSession *session;

@end

@implementation TwoDimensionCodeOriginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化二维码扫描
    [self mInitScanCode];
}


#pragma mark - 二维码扫描
-(void)mInitScanCode{
    
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    //初始化链接对象
    self.session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [self.session addInput:input];
    [self.session addOutput:output];
    
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    //扫描框的位置和大小
    layer.frame = CGRectMake(60, 100, 200, 200);
    [self.view.layer insertSublayer:layer atIndex:0];
    
    //开始捕获
    [self.session startRunning];
}


#pragma mark - 通过代理方法获取扫描到的结果
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    NSLog(@"%s",__func__);
    if (metadataObjects.count>0) {
        //[session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);//一般是http://baike.baidu.com
        
        //停止扫描
        [self.session stopRunning];
        
        //跳转控制器
        WebViewController *webVC = [[WebViewController alloc] init];
        webVC.urlString = metadataObject.stringValue;
        [self.navigationController pushViewController:webVC animated:YES];
    }
}



@end
