//
//  dispatch_do.h
//  SpotOption
//
//  Created by yzr on 16/7/29.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface dispatch_do : NSObject
+ (void)delayTime:(CGFloat)time doSome:(void (^)(id doSome))doSome;
@end
