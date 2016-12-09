//  GetFaceDataViewController.m
//  LQBaseProject
//  Created by YZR on 16/12/8.
//  Copyright © 2016年 YZR. All rights reserved.

#import "GetFaceDataViewController.h"
#import "PhotoSelect.h"

//需要添加
#import <CoreImage/CoreImage.h>

@interface GetFaceDataViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    
}

//点击屏幕获取相片
@property (weak, nonatomic) IBOutlet UIImageView *vReceiveImageView;

@end

@implementation GetFaceDataViewController

-(void)viewDidLoad {
    [super viewDidLoad];
}

// 初始化数据
-(void)mInitImageData:(UIImageView *)imageView{
    
    CIImage* image = [CIImage imageWithCGImage:imageView.image.CGImage];
    
    NSDictionary  *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh
                                                      forKey:CIDetectorAccuracy];
    
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil
                                              options:opts];
    
    //得到面部数据
    NSArray* features = [detector featuresInImage:image];
    NSLog(@"输出脸部数据 = %@",features);
    
    /**
     *   获取到的人脸数据是
     *   输出脸部数据 =
     (
        "<CIFaceFeature: 0x1741045c0>"
     )
     *
     */
}

#pragma mark- 选择 照片后的回调（上传图片）
//  上传图片的协议
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    /*
     UIImagePickerControllerEditedImage;//相册里面被裁剪的图片，于是在这儿设置后，拍照的图片获取不
     UIImagePickerControllerOriginalImage;//获取原图，拍照和相册都能获取
     */
    UIImage *lpImage = [info objectForKey:UIImagePickerControllerEditedImage];//获得图片
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.vReceiveImageView.image = lpImage;
    
    //开始
    [self mInitImageData:self.vReceiveImageView];
    
}


#pragma mark - 点击屏幕 打开相册
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    //设置可以打开相册后的回调
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//设为相册
    picker.allowsEditing = YES;
    picker.delegate = self;
    picker.allowsEditing = YES; //设置选择后的图片可被编辑
    [self presentViewController:picker animated:YES completion:^{ }];
    NSLog(@"可以打开相册");
    
    
}


@end


