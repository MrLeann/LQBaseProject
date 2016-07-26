//
//  DCLabel.m
//  GCBWallet
//
//  Created by YZR on 16/7/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "DCLabel.h"

@interface DCLabel()

@property(strong,nonatomic) NSTextAttachment *attch;
@property(strong,nonatomic) UIImage *networkImage;

/** 内存缓存的图片 */
@property (nonatomic, strong) NSMutableDictionary *images;
/** 队列对象 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation DCLabel

- (void)setDcAttributedString:(NSString *)string {
    _dcAttributedString =  string;
}

- (void)setLocalImg:(UIImage *)localImg {
    [self insertMs:localImg];
}

/**
 * 插入图片
 */
-  (void)insertMs:(UIImage *)img {
    _attch = [[NSTextAttachment alloc] init];
    _attch.image = img;
    _attch.bounds = _imgSize;
    NSMutableAttributedString *ms = [[NSMutableAttributedString alloc]initWithString:_dcAttributedString];
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:_attch];
    [ms insertAttributedString:string atIndex:0];
    self.attributedText = ms;
    [self setPosition:_position];
    [self setImgMargin:_imgMargin]; //重新处理图片的间距
    
}


- (void)setNetworkImg:(NSString *)networkImg {
    UIImage *image = self.images[networkImg];
    if (image) {
        _networkImage =  image;
        [self insertMs:image];
    } else {
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *filename = [networkImg lastPathComponent];
        NSString *file = [cachesPath stringByAppendingPathComponent:filename];
        NSData *data = [NSData dataWithContentsOfFile:file];
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            [self insertMs:image];
            _networkImage =  image;
            self.images[networkImg] = image;
        } else {
            [self.queue addOperationWithBlock:^{
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:networkImg]];
                UIImage *image = [UIImage imageWithData:data];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    _networkImage =  image;
                    [self insertMs:image];
                }];
                self.images[networkImg] = image;
                [data writeToFile:file atomically:YES];
            }];
        }
    }
}

- (void)setImgSize:(CGRect)imgSize {
    _imgSize = imgSize;
}

- (void)setPosition:(NSInteger)position {
    _position = position;
    if(_networkImage || _localImg) {
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:_attch];
        NSMutableAttributedString *ms =[[NSMutableAttributedString alloc]init];
        ms = (NSMutableAttributedString *)self.attributedText;
        [ms replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
        [ms insertAttributedString:string atIndex:position];
    }
}

- (void)setImgMargin:(CGFloat)imgMargin {
    _imgMargin = imgMargin;
    if(_networkImage || _localImg) {
        
        
        NSMutableAttributedString *ms =[[NSMutableAttributedString alloc]init];
        ms = (NSMutableAttributedString *)self.attributedText;
        self.attributedText = ms;
        
        //创建透明图片
        UIView * imageV = [[UIView alloc]init];
        imageV.backgroundColor = [UIColor clearColor];
        imageV.bounds = CGRectMake(0, 0, imgMargin, imgMargin);
        
        //此为透明图片的边距
        UIImage * image = [self imageWithUIView:imageV];
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = image;
        attch.bounds = CGRectMake(0, 0, imgMargin, imgMargin);
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        
        if(_position == 0) {
            [ms insertAttributedString:string atIndex:_position+1];
        }else if(_position == ms.length-1){
            [ms insertAttributedString:string atIndex:_position];
        }else{
            [ms insertAttributedString:string atIndex:_position];
            [ms insertAttributedString:string atIndex:_position+2];
        }
    }
}

- (UIImage*) imageWithUIView:(UIView*) view{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:currnetContext];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (NSOperationQueue *)queue
{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 3;
    }
    return _queue;
}

- (NSMutableDictionary *)images
{
    if (!_images) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
}



@end
