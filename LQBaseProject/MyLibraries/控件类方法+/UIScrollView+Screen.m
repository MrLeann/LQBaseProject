//
//  UIScrollView+Screen.m
//  GCBWallet
//
//  Created by yzr on 16/7/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "UIScrollView+Screen.h"
#import "MyLibraries.h"

@implementation UIScrollView (Screen)
-(void)setScreen:(UIViewController *)vc;
{
    self.contentSize = CGSizeMake(kWidth, kHeight + 1);
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    vc.edgesForExtendedLayout = UIRectEdgeNone;
    
    [vc.view addSubview:self];
}
@end
