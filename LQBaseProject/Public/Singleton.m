//
//  Singleton.m
//  LQBaseProject
//
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "Singleton.h"
#import "AFNetworking.h"


@implementation Singleton


+ (Singleton *)shared
{
    static Singleton *singleton = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        
        singleton = [[Singleton alloc] init];
    });
    return singleton;
}



//  Get
+(void)getWithURL:(NSString *)url andParams:(NSDictionary *)params returnBlock:(returnBlock)block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //        NSLog(@"输出进度 = %@",downloadProgress);
        
        // 这里可以获取到目前的数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        //        NSLog(@"responseObject = %@", responseObject);
        //        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        //        NSLog(@"dic = %@", dic);
        
        //请求成功
        block(nil,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        //        NSLog(@"%@", [error localizedDescription]);
        //请求失败
        block(error,nil);
    }];
    
    
    
    
    
    
    //    //发起网络请求
    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //
    //        id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    //
    //        //请求成功
    //        block(nil,jsonObj);
    //
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        //请求失败
    //        block(error,nil);
    //    }];
    
}

//POST ，参数是字符串
+(void)postWithURL:(NSString *)url andParams:(NSDictionary *)params returnBlock:(returnBlock)block{
    
    // 初始化Manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        //        NSLog(@"responseObject = %@", responseObject);
        //请求成功
        block(nil,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        block(error,nil);
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
        
    }];
    
    //    //发起网络请求
    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //
    ////         NSLog(@"输出responseObject = %@",responseObject);
    //        id jsonObj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    //
    //        //请求成功
    //        block(nil,jsonObj);
    //
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        //请求失败
    //        block(error,nil);
    //    }];
}

#pragma mark - 图片缓存框架
+(void)setImageView:(UIImageView *)imageView withURL:(NSString *)imageUrl placeholderImage:(UIImage *)placeholderimage{
    
//    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:placeholderimage];
    
}


@end
