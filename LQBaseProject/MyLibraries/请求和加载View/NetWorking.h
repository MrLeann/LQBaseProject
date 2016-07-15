//
//  NetWorking.h
//  下拉
//
//  Created by yzr on 16/5/25.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCLoadView.h"

@interface NetWorking : NSObject

+ (void)getURL:(NSString *)URL
         param:(id)param
            vc:(UIViewController *)vc
       success:(void (^)(id jsonObj))success
       failure:(void (^)(NSError *error))failure;

+ (void)postURL:(NSString *)URL
          param:(id)param
             vc:(UIViewController *)vc
        success:(void (^)(id jsonObj))success
        failure:(void (^)(NSError *error))failure;




+ (void)getVarURL:(NSString *)URL
            param:(id)param
          vc:(UIViewController *)vc
          success:(void (^)(id obj))success
          failure:(void (^)(NSError *error))failure;

+ (void)postVarURL:(NSString *)URL
             param:(id)param
           vc:(UIViewController *)vc
           success:(void (^)(id obj))success
           failure:(void (^)(NSError *error))failure;






@end
