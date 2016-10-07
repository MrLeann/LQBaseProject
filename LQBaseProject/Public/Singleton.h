//
//  Singleton.h
//  LQBaseProject
//
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^returnBlock)(NSError *error,id obj);

@interface Singleton : NSObject

@property (nonatomic, copy)NSString *language;



//单例
+ (Singleton *)shared;

//发起GET请求
+(void)getWithURL:(NSString *)url andParams:(NSDictionary *)params returnBlock:(returnBlock)block;

//发起POST请求（）
+(void)postWithURL:(NSString *)url andParams:(NSDictionary *)params returnBlock:(returnBlock)block;

//图片缓存
+(void)setImageView:(UIImageView *)imageView withURL:(NSString *)imageUrl placeholderImage:(UIImage *)placeholderimage;





@end
