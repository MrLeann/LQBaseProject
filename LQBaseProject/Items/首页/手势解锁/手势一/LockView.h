//
//  LockView.h
//  GCBWallet
//
//  Created by yzr on 16/7/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LockView;
@protocol LockViewDelegate <NSObject>


@optional
-(void)lockView:(LockView *)lockView didFinishedWithPath:(NSString *)path;

@end

@interface LockView : UIView


@property(nonatomic,weak)id<LockViewDelegate>delegate;

@property(nonatomic,copy)void(^LineBack)(NSString *);


@end
