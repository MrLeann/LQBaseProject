//
//  MySave.h
//  保存密码
//
//  Created by yzr on 16/7/1.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySave : NSObject

//keychain 钥匙串保存

+ (void)saveValue:(NSString *)sValue forKey:(NSString *)sKey;


+ (NSString *)readKey:(NSString *)sKey;


+ (void)deleteKey:(NSString *)sKey;


@end
