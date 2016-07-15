//
//  TCLoad.h
//  夜间模式
//
//  Created by yzr on 16/5/17.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AFNetworking.h"
#import "NetWorking.h"

@interface TCLoadView : UIView

+(instancetype)addTCLoad;

+(void)show:(UIViewController *)vc;

+(void)hide:(UIViewController *)vc;
@property (nonatomic, strong)UIActivityIndicatorView *juhua;
@end
