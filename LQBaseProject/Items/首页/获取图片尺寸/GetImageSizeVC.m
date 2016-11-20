//  GetImageSizeVC.m
//  LQBaseProject
//  Created by YZR on 16/11/14.
//  Copyright © 2016年 YZR. All rights reserved.

#import "GetImageSizeVC.h"
#import "SDImageCache.h"

#import "GetImageSizeCell.h"// 根据类型判断高度的方法
#import "ImageHeightHandle.h"// 根据图片url后面的尺寸获取尺寸


//导入计算头文件
#import "ImageSize.h"

#define kImgUrl1 @"http://pic27.nipic.com/20130310/4499633_163759170000_2.jpg"
#define kImgUrl2 @"http://pic.nipic.com/2008-03-18/2008318144250841_2.jpg"
#define kImgUrl3 @"http://www.bizhiwa.com/uploads/allimg/2011-12/10224R5-1-1464B.jpg"
#define kImgUrl4 @"http://a.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3ce330c2b499145d688d53f20f8.jpg"
#define kImgUrl5 @"http://a.hiphotos.baidu.com/image/h%3D200/sign=3d95da6bab51f3dedcb2be64a4eff0ec/b812c8fcc3cec3fd5c80b5d4d288d43f869427d0.jpg"
#define kImgUrl6 @"http://himg2.huanqiu.com/attachment2010/2013/0214/20130214093328811.jpg"
#define kImgUrl7 @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1479110411&di=a0a2d879c18e9d8c065fb9d87d06645f&src=http://pic13.nipic.com/20110419/2457331_142656838000_2.png"


typedef NS_ENUM(NSUInteger, ImageType) {
    PngImage = 1,
    JpgImage,
    GifImage,
};

@interface GetImageSizeVC()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *_titleImgArray;
}

@property (weak, nonatomic) IBOutlet UITableView *vTableView;

@end

@implementation GetImageSizeVC
{
    ImageType type;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _titleImgArray = @[kImgUrl1,kImgUrl2,kImgUrl3,kImgUrl4,kImgUrl5,kImgUrl6,kImgUrl7];
    self.view.backgroundColor = kWhiteColor;
    [self mInitTableView];
    
    [self mInitData];
}

-(void)mInitTableView{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.vTableView.backgroundColor = kWhiteColor;
    [self.vTableView registerNib:[UINib nibWithNibName:@"GetImageSizeCell" bundle:nil] forCellReuseIdentifier:@"GetImageSizeCell"];
}

//初始化数据
-(void)mInitData{
}

#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
    
    
    /*
     
     //这个是根据图片的url 后面的尺寸数据来获取
     NSDictionary *dic = self.data[indexPath.row];
     NSString *url = dic[@"ImageURL"];
     CGFloat imageDefaultHeight = (kWidth - 10 )/2;//分辨率解析失败默认高度
     CGFloat imageHeight = [ImageHeightHandle imageHeightWithUrl:url imageWidth:kWidth-10 defaultHeight:imageDefaultHeight];//实际高度
     return imageHeight;
     
     */
}

//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

//
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark - 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GetImageSizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GetImageSizeCell" forIndexPath:indexPath];
    NSString *_imageUrl = _titleImgArray[arc4random_uniform(7)];
    [Singleton setImageView:cell.vImage withURL:_imageUrl placeholderImage:nil];
    
    /*
     *  获取在本地的图片
     */
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:_imageUrl];
    NSLog(@"输出本地图片 = %@",cachedImage);
    
    //NSData *_imageData = UIImagePNGRepresentation(cachedImage);
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//获取jpg图片的大小
+(CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request{
    
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}

@end
