//
//  CHUserDataManager.h
//  NewCloud
//
//  Created by YZR on 16/5/14.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHKeychain.h"

@interface CHUserDataManager : NSObject

/**
 *  存储用户名
 */
+(void)saveUserName:(NSString *)userName;//存用户名
+(id)readUserName;//读取用户名
+(void)deleteUserName;//删除用户名



/**
 *  @brief  存储密码
 *  @param  password    密码内容
 */
+(void)savePassWord:(NSString *)password;


/**
 *  @brief  读取密码
 *
 *  @return 密码内容
 */
+(id)readPassWord;

/**
 *  @brief  删除密码数据
 */
+(void)deletePassWord;



@end
