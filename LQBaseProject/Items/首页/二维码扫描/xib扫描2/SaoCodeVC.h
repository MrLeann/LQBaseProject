//
//  SaoCodeVC.h
//  SaoCode
//
//  Created by yzr on 16/9/1.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SaoCodeVC;

@protocol SaoCodeVCDelegate <NSObject>

/**
 *  读取到结果时会调用下面的代理方法
 *
 *  @param reader 扫描二维码控制器
 *  @param result 扫描结果
 */
-(void)reader:(SaoCodeVC *)reader didScanResult:(NSString *)result;

@end

@interface SaoCodeVC : UIViewController

@property (nonatomic, weak) id<SaoCodeVCDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITabBarItem *bar1;
@property (weak, nonatomic) IBOutlet UITabBarItem *bar2;

/*
 *  设置扫描二维码完成后回调的block
 *  @param completionBlock 完成block
 */
-(void)setCompletionWithBlock:(void (^) (NSString *resultAsString))completionBlock;

//-(void)setStarVC:(UIViewController *)vc;

@end


