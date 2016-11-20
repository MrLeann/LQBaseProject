//
//  PhotosGranted.m
//  摄像头权限
//
//  Created by yzr on 16/9/10.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "PhotosGranted.h"
#import <Photos/Photos.h>


@implementation PhotosGranted
+(void)getPhotoYes:(yesBlock)yesBlock no:(noBlock)noBlock{
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    yesBlock();
                });
            }else {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    noBlock();
                });
            }
        }];
    }else if (authStatus == AVAuthorizationStatusAuthorized){
        yesBlock();
        
    }else  noBlock();

}
@end
