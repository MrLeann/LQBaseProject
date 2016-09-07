//
//  CHUserDataManager.m
//  NewCloud
//
//  Created by YZR on 16/5/14.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import "CHUserDataManager.h"

@implementation CHUserDataManager

/**   用户名  */
static NSString * const KEY_IN_USERKEYCHAIN = @"com.newcloud.app.userallinfo";
static NSString * const KEY_USER = @"com.newcloud.app.user";

/**   密码 这是定义的Key值 */
static NSString * const KEY_IN_KEYCHAIN = @"com.newcloud.app.allinfo";
static NSString * const KEY_PASSWORD = @"com.newcloud.app.password";


//存储用户名
+(void)saveUserName:(NSString *)userName{
    
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:userName forKey:KEY_USER];
    
    [CHKeychain save:KEY_IN_USERKEYCHAIN data:usernamepasswordKVPairs];
    
}

//读取用户名
+(id)readUserName{
    
    
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[CHKeychain load:KEY_IN_USERKEYCHAIN];//根据KeyChain的键值读取
    
    return [usernamepasswordKVPair objectForKey:KEY_USER];

}

//删除用户名
+(void)deleteUserName{
    
    [CHKeychain delete:KEY_IN_USERKEYCHAIN];
}

// ***************** 密码 ********************
//存储密码
+(void)savePassWord:(NSString *)password
{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:password forKey:KEY_PASSWORD];
    [CHKeychain save:KEY_IN_KEYCHAIN data:usernamepasswordKVPairs];
}

+(id)readPassWord
{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[CHKeychain load:KEY_IN_KEYCHAIN];
    return [usernamepasswordKVPair objectForKey:KEY_PASSWORD];
}

+(void)deletePassWord
{
    [CHKeychain delete:KEY_IN_KEYCHAIN];
}

@end
