//
//  MyLibraries.h
//  NewCloud
//
//  Created by yzr on 16/6/21.
//  Copyright © 2016年 yzr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#import "NavView.h"          //导航View
#import "UIButton+Btn.h"   //按钮属性
#import "NetWorking.h"     //网络请求
#import "ForInView.h"    //遍历View
#import "UIColor+helper.h" //颜色
#import "TCLoadView.h"  //加载View
#import "NoticeView.h" //通知View
#import "Adapt.h"     //适配
#import "UITextField+MyPlace.h"  //文本框占位View
#import "BlackView.h"    //背景View
#import "MyStr.h"        //字符串formart
#import "Keyboard.h"    //键盘监听
#import "Cache.h"
#import "UILabel+TextSpace.h" //
#import "AdaptText.h"
#import "MySave.h"  //钥匙串保存
#import "UIView+Frame.h"  //frane简写
#import "Animation.h"   //虚幻动画
#import "HeaderSC.h"
#import "UIScrollView+Screen.h"


@interface MyLibraries : NSObject

@end

#define kSystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
#define iOS9Later (kSystemVersion>=9.0)
#define iOS8Later (kSystemVersion>=8.0)
#define iOS7Later (kSystemVersion>=7.0)

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height


#ifdef DEBUG
#define TCLog(...)  NSLog(__VA_ARGS__)

#else
#define TCLog(...)
#endif

#define  RGBColor(r, g, b)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define  NavPush(vc, s)     [s.navigationController pushViewController:[[vc alloc]init] animated:YES];






































