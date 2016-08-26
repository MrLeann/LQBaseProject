//
//  Animation.m
//  UIView动画
//
//  Created by yzr on 16/7/2.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import "Animation.h"
#import "dispatch_do.h"


@implementation Animation

 //虚幻动画隐藏
+(void)setHideView:(UIView *)view time:(CGFloat)time
{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = time;
    [view.layer addAnimation:animation forKey:nil];
    view.hidden = YES;
    
    
}
//虚幻动画显示
+(void)setShowView:(UIView *)view time:(CGFloat)time
{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = time;
    [view.layer addAnimation:animation forKey:nil];
    view.hidden = NO;
    
    
}

+(void)setLeftHide:(UIView *)view time:(CGFloat)time //左缩小隐藏
{
    NSInteger with = view.frame.size.width;
    NSInteger height = view.frame.size.height;
    
    view.tag = with * 10000 + height;
    
    [UIView animateWithDuration:time animations:^
     {
         view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, 0, 0);
         
     }];
}
+(void)setRightShow:(UIView *)view time:(CGFloat)time //右放大显示
{
    
    if (view.tag > 10000) {
        
        [UIView animateWithDuration:time animations:^
         {
             view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.tag/10000, view.tag%10000);
             
         }];
    }
}

//下拉显示
+ (void)setOpenView:(UIView *)view time:(CGFloat)time height:(CGFloat)height
{
    view.hidden = NO;
    [UIView animateWithDuration:time animations:^{
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height);
    }];
}
//上拉隐藏
+ (void)setCloseView:(UIView *)view time:(CGFloat)time height:(CGFloat)height
{
    [UIView animateWithDuration:time animations:^{
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height);
    }];
    
    [dispatch_do delayTime:time doSome:^(id doSome) { //dispatch延迟
        view.hidden = YES;
    }];
    

    
}



//弹簧位移动画
+(void)setTanView:(UIView *)view time:(CGFloat)time tan:(CGFloat)tan centerX:(CGFloat)centerX centerY:(CGFloat)centerY
{
    [UIView animateWithDuration:time delay:0 usingSpringWithDamping:tan initialSpringVelocity:0 options:0 animations:^{
        
        view.center = CGPointMake(centerX, centerY);
        
    } completion:nil];
}


//搓牌揭示动画   可实现替换图片动画    
+ (void)setRevealView:(UIView *)view  time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/4]; //延迟加载
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setType:kCATransitionReveal];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [Animation setType:type animation:animation]; //类型选择    
    [view.layer addAnimation:animation forKey:nil];
}

//180°翻转动画   上下左右
+ (void)setFlipView:(UIView *)view  time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target
{
    if (type <= 1) {
        if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/2]; //延迟加载
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:time];
        if (type == 0) {
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:NO];
        }else  [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:view cache:NO];
        [UIView commitAnimations];
    }else{
        if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/2]; //延迟加载
        CATransition *animation = [CATransition animation];
        [animation setDuration:time];
        [animation setFillMode:kCAFillModeForwards];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [animation setType:@"oglFlip"];
        if (type == 2) [animation setSubtype:@"fromTop"];
        else [animation setSubtype:@"fromBottom"];      
        [view.layer addAnimation:animation forKey:nil];
    }
    
}

//push 挤开动画  
+ (void)setPushView:(UIView *)view time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target
{
     if (target != nil) [vc performSelector:target withObject:nil afterDelay:0]; //延迟加载
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:kCATransitionPush];
    [Animation setType:type animation:animation]; //类型选择
    
    [view.layer addAnimation:animation forKey:nil];
}

//present 移动覆盖动画
+ (void)setPresentView:(UIView *)view time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:0]; //延迟加载
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setType:kCATransitionMoveIn];
    
    [Animation setType:type animation:animation]; //类型选择
    [view.layer addAnimation:animation forKey:nil];
}

// 向右旋转45°缩小到最小,然后再从小到大显示. 
+(void)setBlowView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/2]; //延迟加载
    
    [UIView animateWithDuration:time/2 animations:^
     {
         view.transform = CGAffineTransformMakeScale(0.001, 0.001);
         CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
         animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.70, 0.40, 0.80)];
         animation.duration = time/2;
         animation.repeatCount = 1;
         [view.layer addAnimation:animation forKey:nil];         
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:time/2 animations:^
          {
              view.transform = CGAffineTransformMakeScale(1.0, 1.0);
          }];
     }];
}

//旋转缩小再旋转放大动画
+ (void)setSpinView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target
{
  if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/2]; //延迟加载
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2];
    rotationAnimation.duration = time/2;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.duration = time/2;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = time/2;
    animationGroup.autoreverses = YES;
    animationGroup.repeatCount = 1;
    animationGroup.animations =[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil];
    [view.layer addAnimation:animationGroup forKey:@"animationGroup"];
}

//立体翻转动画 上下左右
+ (void)setCubeView:(UIView *)view time:(CGFloat)time type_0_3:(NSInteger)type vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:0]; //延迟加载
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"cube"];
    if (type == 0) {
      [animation setSubtype:@"fromLeft"];
    }else if (type == 1){
      [animation setSubtype:@"fromRight"];
    }else if (type == 2){
        [animation setSubtype:@"fromTop"];
    }else [animation setSubtype:@"fromBottom"];
 
    [view.layer addAnimation:animation forKey:nil];
}


//手动翻页动画  只写2种，往下翻 + 往回翻
+ (void)setPageView:(UIView *)view  time:(CGFloat)time isNext:(BOOL)isNext vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:0]; //延迟加载
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setSubtype:@"fromBottom"];
    
    if (isNext == NO) {
        [animation setType:@"pageUnCurl"];
    }else [animation setType:@"pageCurl"];
  
    [view.layer addAnimation:animation forKey:nil];
}

//按水动画
+ (void)setWaterView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/4]; //延迟加载
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"rippleEffect"];
    
    [view.layer addAnimation:animation forKey:nil];
}

//撕书丢动画
+ (void)setDitchView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:0]; //延迟加载
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setType:@"suckEffect"];
    
    [view.layer addAnimation:animation forKey:nil];
}

//相机咔擦动画  开 + 关
+ (void)setWatchView:(UIView *)view time:(CGFloat)time isOpen:(BOOL)isOpen vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:0]; //延迟加载
    CATransition *animation = [CATransition animation];
    [animation setDuration:time];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setSubtype:@"fromRight"];
    if (isOpen == YES)  [animation setType:@"cameraIrisHollowOpen"];
    else   [animation setType:@"cameraIrisHollowClose"];
    
    [view.layer addAnimation:animation forKey:nil];
}

//最小化动画
+(void)setLeastView:(UIView *)view time:(CGFloat)time vc:(UIViewController *)vc target:(SEL)target
{
    if (target != nil) [vc performSelector:target withObject:nil afterDelay:time/2]; //延迟加载
    CGFloat with = view.frame.size.width;
    CGFloat height = view.frame.size.height;
    
    [UIView animateWithDuration:time/2 animations:^{
         view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, 0, 0);

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:time/2 animations:^
         {
             view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, with, height);
                          
         }];
    }];
    
}






//类型选择  上下左右
+(void)setType:(NSInteger)type animation:(CATransition*)animation
{
    if (type == 0) {
        [animation setSubtype:kCATransitionFromTop];
    }else if (type == 1) {
        [animation setSubtype:kCATransitionFromBottom];
    }else if (type == 2) {
        [animation setSubtype:kCATransitionFromLeft];
    }else if (type == 3) {
        [animation setSubtype:kCATransitionFromRight];
    }else{
        [animation setSubtype:kCATransitionFromBottom];
    }
}

@end
