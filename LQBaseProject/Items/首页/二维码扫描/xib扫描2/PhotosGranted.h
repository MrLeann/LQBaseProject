//
//  PhotosGranted.h
//  摄像头权限
//
//  Created by yzr on 16/9/10.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^yesBlock)();

typedef void(^noBlock)();

@interface PhotosGranted : NSObject

+(void)getPhotoYes:(yesBlock)yesBlock no:(noBlock)noBlock;

@end
