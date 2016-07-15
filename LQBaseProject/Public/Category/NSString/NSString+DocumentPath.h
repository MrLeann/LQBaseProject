//
//  NSString+DocumentPath.h
//  气泡
//
//  Created by zzy on 14-5-15.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DocumentPath)

/**
 *    返回文件的目录
 *
 */
+(NSString *)documentPathWith:(NSString *)fileName;

@end


