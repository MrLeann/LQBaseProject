//
//  NetWorking.m
//  下拉
//
//  Created by yzr on 16/5/25.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "NetWorking.h"
#import "AFNetworking.h"


@implementation NetWorking




+ (void)getURL:(NSString *)URL
         param:(id)param
            vc:(UIViewController *)vc
       success:(void (^)(id jsonObj))success
       failure:(void (^)(NSError *error))failure;
{
    
    [TCLoadView show:vc];  //******* ???? ****//
    
    AFHTTPSessionManager *m =  [AFHTTPSessionManager manager];
    m.requestSerializer = [AFJSONRequestSerializer serializer];
                             
    [m GET:URL parameters:param progress:^(NSProgress *downloadProgress) {
    } success:^(NSURLSessionDataTask *task, id jsonObj) {
        
        [TCLoadView hide:vc];  //******* ???? ****//
        if (success) {
            if ([jsonObj[@"Code"] integerValue] == 2000) {
                success(jsonObj);
            }else{
//                [vc.view toastShow:jsonObj[@"Msg"]];
            }
        }
        
        
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [TCLoadView hide:vc];  //******* ???? ****//
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}

+ (void)postURL:(NSString *)URL
          param:(id)param
             vc:(UIViewController *)vc
        success:(void (^)(id jsonObj))success
        failure:(void (^)(NSError *error))failure;
{
    [TCLoadView show:vc];  //******* ???? ****//
    
    AFHTTPSessionManager *m =  [AFHTTPSessionManager manager];
    m.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [m POST:URL parameters:param progress:^(NSProgress *downloadProgress) {
    } success:^(NSURLSessionDataTask *task, id jsonObj) {
        
        [TCLoadView hide:vc];   //******* ???? ****//
        
        if (success) {
            if ([jsonObj[@"Code"] integerValue] == 2000) {
                
                success(jsonObj);
                
            }else{
//                [vc.view toastShow:jsonObj[@"Msg"]];
            }

        }
        
        
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [TCLoadView hide:vc];   //******* ???? ****//
        
        if (failure) {
            failure(error);
        }
        
    }];
    
    
}




+ (void)getVarURL:(NSString *)URL
            param:(id)param
          vc:(UIViewController *)vc
          success:(void (^)(id obj))success
          failure:(void (^)(NSError *error))failure
{
    [TCLoadView show:vc];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/x-javascript"];
    [manager GET:URL parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable obj) {
        
        [TCLoadView hide:vc];
        
        if (success) {
            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString *obj1 = [[NSString alloc] initWithData:obj encoding:enc];
            success(obj1);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [TCLoadView hide:vc];
        
        if (failure) {
            failure(error);
        }
    }];
    
    
}


+ (void)postVarURL:(NSString *)URL
             param:(id)param
           vc:(UIViewController *)vc
           success:(void (^)(id obj))success
           failure:(void (^)(NSError *error))failure
{
    [TCLoadView show:vc];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/x-javascript"];
    [manager POST:URL parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable obj) {
        
         [TCLoadView hide:vc];
        
        if (success) {
            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString *obj1 = [[NSString alloc] initWithData:obj encoding:enc];
            success(obj1);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
         [TCLoadView hide:vc];
        
        if (failure) {
            failure(error);
        }
    }];
    
    
}

@end
