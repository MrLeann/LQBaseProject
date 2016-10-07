//  QRCodeScanVC.h
//  LQBaseProject
//  Created by YZR on 16/9/8.
//  Copyright © 2016年 YZR. All rights reserved.
/*
    二维码 扫描
 */

#import <UIKit/UIKit.h>

/*
 *   创建协议
 */
@class SaoCodeVC;

@protocol SaoCodeVCDelegate <NSObject>

/*
 *  读取到结果时会调用下面的代理方法
 *  @param reader 扫描二维码控制器
 *  @param result 扫描结果
 */
- (void)reader:(SaoCodeVC *)reader didScanResult:(NSString *)result;

@end


@interface QRCodeScanVC : UIViewController

//协议
@property (nonatomic, weak) id<SaoCodeVCDelegate> delegate;

// 按钮1
@property (weak, nonatomic) IBOutlet UITabBarItem *bar1;
// 按钮2
@property (weak, nonatomic) IBOutlet UITabBarItem *bar2;



/**
 *  设置扫描二维码完成后回调的block
 *
 *  @param completionBlock 完成block
 */
- (void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock;


@end







