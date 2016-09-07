//
//  CHKeychain.h
//  NewCloud
//
//  Created by YZR on 16/5/14.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>


/**
 *  KeyChain加密是苹果官方提供的加密方式
 *  相关博文地址http://blog.csdn.net/yiyaaixuexi/article/details/7688745
 */


@interface CHKeychain : NSObject

+ (void)save:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)delete:(NSString *)service;

@end
