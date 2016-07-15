/*
 步骤如下：
 
 */



#import "HomeScanViewController.h"
#import "WebViewController.h"


#define Height [UIScreen mainScreen].bounds.size.height
#define Width [UIScreen mainScreen].bounds.size.width

#define XCenter self.view.center.x
#define YCenter self.view.center.y

//#define SHeight 20

//屏幕中心加30
//#define SWidth (XCenter+30)

//扫描大小（宽、高）
#define scanWidth 200
#define scanHeight 200

@interface HomeScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    
    UIImageView * imageView;//扫描框周边图片
    
    int num;
    BOOL upOrdown;//判断线条是上、下位置
    NSTimer * timer;//定时器
}


@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;

@property (nonatomic, retain) UIImageView * line;//线条

@end

@implementation HomeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //初始化扫描View
    [self mInitScanView];
    
    //开始扫描
    [self setupCamera];
    
}



#pragma mark - 初始化扫描View
-(void)mInitScanView{
    
    //显示提示语
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(60,100, kWindowWidth-60*2, 50)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=2;
    labIntroudction.textColor=[UIColor blackColor];
    labIntroudction.text=@"将条码二维码放入框中就能自动扫描";
    [self.view addSubview:labIntroudction];
    
    //扫描的背景框，带边框的那个
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kWindowWidth-scanWidth)/2,(kWindowHeight-64-scanHeight)/2,scanWidth,scanHeight)];
    imageView.image = [UIImage imageNamed:@"scanscanBg.png"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num =0;
    
    //添加扫描线条
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(imageView.frame)+5, CGRectGetMinY(imageView.frame)+5, scanWidth-10,1)];
    
    _line.image = [UIImage imageNamed:@"scanLine@2x.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
}

#pragma mark - 开启定时器，加载扫描动画
-(void)animation1{
    
    if (upOrdown == NO) {
        
        num ++;
        _line.frame = CGRectMake(CGRectGetMinX(imageView.frame)+5, CGRectGetMinY(imageView.frame)+5+2*num, scanWidth -10,1);
        
        if (num ==(int)(( scanWidth-10)/2)) {
            upOrdown = YES;
        }
    }else{
        
        num --;
        _line.frame =CGRectMake(CGRectGetMinX(imageView.frame)+5, CGRectGetMinY(imageView.frame)+5+2*num, scanWidth-10,1);
        
        if (num == 0) {
            upOrdown = NO;
        }
    }
}

//扫描初始化
- (void)setupCamera{
    
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //设置扫描范围
    _output.rectOfInterest =[self rectOfInterestByScanViewRect:imageView.frame];//CGRectMake(0.1, 0, 0.9, 1);//
    
    /**
     
     苹果提供了一种方式让我们规定扫描范围：在AVCaptureMetadataOutput中有一个叫做rectOfInterest的CGRect类型属性，这个属性用来限制扫描范围。
     这个属性的每一个值取值范围在0~1之间，代表的是对应轴上的比例大小。最开始我以为这个是以左上角为原点，后来设置为CGRectMake(0.3, 0.35, 0.4, 0.3)发现和预期的不一样，因为这个属性是以屏幕右上角为坐标原点，并且宽高的顺序要对换过来
     原文链接：http://www.jianshu.com/p/4772d3cb6a43#
     
     */
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode];
    
    
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResize;
    
    //扫描框的位置和大小
    _preview.frame =CGRectMake(0, 64, kWindowWidth, kWindowHeight - 64);
    
    
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    //添加图片View
    [self.view bringSubviewToFront:imageView];
    
    //设置模糊View
    [self setOverView];
    
    // Start
    [_session startRunning];
}

#pragma mark - 扫描结果协议
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        /**
         *  获取扫描结果
         */
        stringValue = metadataObject.stringValue;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"扫描结果：%@", stringValue] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        //取消继续开始扫描
        [_session startRunning];
    }]];
    
    [self presentViewController:alert animated:true completion:nil];
    
    
    [_session stopRunning];
    //    [self dismissViewControllerAnimated:YES completion:^
    //     {
    //         [timer invalidate];
    //
    //     }];
}


//这个是上面设置扫描区域的
- (CGRect)rectOfInterestByScanViewRect:(CGRect)rect {
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    
    CGFloat x = (height - CGRectGetHeight(rect)) / 2 / height;
    CGFloat y = (width - CGRectGetWidth(rect)) / 2 / width;
    
    CGFloat w = CGRectGetHeight(rect) / height;
    CGFloat h = CGRectGetWidth(rect) / width;
    
    return CGRectMake(x, y, w, h);
}

#pragma mark - 添加模糊View
- (void)setOverView {
    
    
    //图片的frame
    CGFloat x = CGRectGetMinX(imageView.frame);//图片的x位置
    CGFloat y = CGRectGetMinY(imageView.frame);//图片的y位置
    CGFloat w = CGRectGetWidth(imageView.frame);
    CGFloat h = CGRectGetHeight(imageView.frame);
    
    //注意添加的这个View  范围是中间掏空的区域去掉的范围，所以设置4块View
    [self creatView:CGRectMake(0, 64, kWindowWidth, (y - 64))];
    [self creatView:CGRectMake(0, y, x, h)];//图片左边区域
    [self creatView:CGRectMake(0, y + h, kWindowWidth, kWindowHeight - y - h)];//图片的整个下边区域
    [self creatView:CGRectMake(x + w, y, kWindowWidth - x - w, h)];//图片右边区域
}

- (void)creatView:(CGRect)rect {
    
    CGFloat alpha = 0.5;
    UIColor *backColor = [UIColor grayColor];
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = backColor;
    view.alpha = alpha;
    [self.view addSubview:view];
}

#pragma mark - 视图出现加载扫描
-(void)viewWillDisappear:(BOOL)animated{
    
    //    [_session stopRunning];
    
}


@end
