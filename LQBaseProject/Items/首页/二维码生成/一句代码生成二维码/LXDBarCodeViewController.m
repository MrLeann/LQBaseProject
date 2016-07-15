// 1、先导入LXDCreateBarcode
// 2、添加头文件#import "UIImage+LXDCreateBarcode.h"
//
//
/**
 *  注意此 Demo 是二维码中间带图片的，也可以设置中间不插入图片
 */



#import "LXDBarCodeViewController.h"

#import "UIImage+LXDCreateBarcode.h"//需添加

@interface LXDBarCodeViewController ()

@end

@implementation LXDBarCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - 点击生成二维码
- (IBAction)mCreateCodeClick:(UIButton *)sender {
    
    UIImage * image = [UIImage imageOfQRFromURL: @"https://appsto.re/cn/Jd2W-.i " codeSize: 1000 red: 0 green: 0 blue: 0 insertImage: [UIImage imageNamed: @"applicationIcon"] roundRadius: 15.0f];
    
    CGSize size = image.size;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:  ((CGRect){(CGPointZero), (size)})];
    imageView.center = self.view.center;
    imageView.image = image;
    
    
    [self.view addSubview: imageView];
    
}


@end
