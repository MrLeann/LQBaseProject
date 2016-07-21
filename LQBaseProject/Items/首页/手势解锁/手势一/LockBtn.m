//
//  LockBtn.m
//  GCBWallet
//
//  Created by yzr on 16/7/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LockBtn.h"

@implementation LockBtn


-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initLockButton];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initLockButton];
    }
    return self;
}


-(void)initLockButton {
    
    self.userInteractionEnabled = NO;
    
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_normal"] forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_select"] forState:UIControlStateSelected];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat touchWidth = 60;
    CGFloat touchHeight = 60;
    CGFloat touchX = self.center.x - touchWidth/2;
    CGFloat touchY = self.center.y - touchHeight/2;
    self.touchFrame = CGRectMake(touchX, touchY, 60, 60);
}


@end
