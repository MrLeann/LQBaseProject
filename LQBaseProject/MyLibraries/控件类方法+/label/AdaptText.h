//
//  AdaptLabel.h
//  jiexi
//
//  Created by yzr on 16/6/21.
//  Copyright © 2016年 tancan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AdaptText : NSObject

#pragma mark - 自适应高度
+(CGFloat)setHeight:(NSString *)string lineSpace:(CGFloat)lf paraSpace:(CGFloat)pf alignment:(NSInteger)index kerSpace:(CGFloat)ker font:(NSInteger)fontIndex toLeft:(CGFloat)toLeft toRight:(CGFloat)toRight;


#pragma mark - 自适应宽度
+(CGFloat)setWith:(NSString *)string forFont:(NSInteger)fontIndex;

+(CGFloat)setWith:(NSString *)string BoldFont:(NSInteger)BoldFontIndex;//加粗时的宽度

+(CGFloat)setWith:(NSString *)string font:(UIFont *)font;

@end
