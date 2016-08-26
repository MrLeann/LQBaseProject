//
//  Adapt.h
//  
//
//  Created by mac on 16/6/7.
//
//

#import <UIKit/UIKit.h>

#define kAdapt(a,b,c)  [Adapt FiveS_Up:@[@a,@b,@c]]

@interface Adapt : UIView

+(CGFloat)FiveS_Up:(NSArray *)arr;
+(CGFloat)setFiveToEight:(NSString *)str forArr:(NSArray *)arr;
+ (NSString *)arcStr;
@end
