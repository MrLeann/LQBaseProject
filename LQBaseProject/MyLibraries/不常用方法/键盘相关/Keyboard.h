//
//  Keyboard.h
//  virtualdeal
//
//  Created by yzr on 16/6/20.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Keyboard : NSObject

+(void)addKeyNotify:(UIViewController *)vc show:(SEL)show hide:(SEL)hide;
+(CGFloat)isHeight:(UIViewController *)vc notify:(NSNotification *)notification;

@end
