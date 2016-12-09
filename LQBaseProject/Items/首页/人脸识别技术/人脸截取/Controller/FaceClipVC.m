//  FaceClipVC.m
//  LQBaseProject
//  Created by YZR on 16/12/8.
//  Copyright © 2016年 YZR. All rights reserved.

#import "FaceClipVC.h"
#import "KLFaceDetector.h"
#define FACEIMGVIEW_TAG    100001

@interface FaceClipVC ()

@property (nonatomic, strong) UIImageView * faceImgView;

@end

@implementation FaceClipVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [super viewDidLoad];
    UIImage * img = [UIImage imageNamed:@"Test.jpg"];
    CGSize imgSize = [img size];
    CGSize imgViewSize = CGSizeMake(self.view.frame.size.height/2.0*imgSize.width/imgSize.height, self.view.frame.size.height/2.0);
    self.faceImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, imgViewSize.width, imgViewSize.height)];
    [self.faceImgView setImage:img];
    [self.view addSubview:self.faceImgView];
    
    UIButton * getFaceBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [getFaceBtn setBackgroundColor:[UIColor lightGrayColor]];
    [getFaceBtn setFrame:CGRectMake(10, CGRectGetMaxY(self.faceImgView.frame)+10, 90, 30)];
    [getFaceBtn setTitle:@"GetFace" forState:UIControlStateNormal];
    [getFaceBtn addTarget:self action:@selector(getFace:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getFaceBtn];
}

#pragma mark - LifeCycle
- (void)loadView{
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UIView * view = [[UIView alloc] initWithFrame:bounds];
    [view setBackgroundColor:[UIColor whiteColor]];
    [self setView:view];
}

#pragma mark - Action
-(void)getFace:(UIButton *)btn{
    
    // 首先移除预览加载的图片
    [[self.view viewWithTag:FACEIMGVIEW_TAG] removeFromSuperview];
    
    CGSize imgSize = CGSizeMake(100, 200); // 可随意改变图片尺寸
    
    [btn setTitle:@"Working..." forState:UIControlStateNormal];
    
    [KLFaceDetector getFaceFromImage:self.faceImgView.image faceSize:imgSize shouldFast:YES completionHandler:^(UIImage * faceImg) {
        [btn setTitle:@"GetFace" forState:UIControlStateNormal];
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+15, CGRectGetMaxY(self.faceImgView.frame)+25, imgSize.width, imgSize.height)];
        [imgView setBackgroundColor:[UIColor darkGrayColor]];
        [imgView setTag:FACEIMGVIEW_TAG];
        [imgView setImage:faceImg];
        [self.view addSubview:imgView];
    }];
}

@end
