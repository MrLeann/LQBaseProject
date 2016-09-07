//
//  Xuebei
//
//  Created by maceasy on 15/11/25.
//  Copyright © 2015年 macHY. All rights reserved.
//

#import "WSYToastView.h"
#import "NSString+Extension.h"
#import "UIView+Extension.h"
@interface WSYToastView(){
    
    CGRect contentViewFrame;//此View 的位置frame
    CGSize stringSizeMult;//多行计算出来的size
}

@property (weak,nonatomic) UILabel *title;

@end


@implementation WSYToastView

+ (instancetype)toastWithString:(NSString *)string
{
    return [[self alloc] initToastWithString:string];
}

- (instancetype)initToastWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        
        //stringSize ：根据传过来的字符串计算出来的Size
        //finalY :提示框 距离y轴的位置
        //contentViewFrame ：此View 的位置frame
        
        
        //定义屏幕的位置
        CGFloat mainScreenwidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat mainScreenheight = [UIScreen mainScreen].bounds.size.height;
        CGFloat margin = 50;//此 view 距离屏幕边界的距离x2
        
        
        //根据字体得到 NSString 的尺寸
        CGSize stringSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        
        //单行 能接受的最大宽度 （ 即距离左右两边各25的距离 ）
        CGFloat maxContentWith = mainScreenwidth - margin;
        
        
        
        
        if (stringSize.width <= maxContentWith) {
            //单行， 如果此字符串宽度小于等于maxContentWith则是单行
            //此View 显示的frame （包括边界）
            //提示框的y轴位置(上面是原始的，后面是我改的剧中)
            CGFloat finalY = (mainScreenheight - 20 - stringSize.height) * 0.8;//单行时距离y的距离
            
            
            contentViewFrame = CGRectMake((mainScreenwidth - stringSize.width - margin) * 0.5, finalY, stringSize.width + 40, 20 + stringSize.height);
            
            //此View的 初始位置
            [self setFrame:CGRectMake((mainScreenwidth - stringSize.width - margin) * 0.5, finalY+30, stringSize.width + 40, 20 + stringSize.height)];
            
        }else{
            //多行
            //先计算frame
            stringSizeMult = [self mCalculateVerticalSize:string postLabelMaxWidth:maxContentWith font:[UIFont systemFontOfSize:16] defaultSpace:5];
            
            //可以还做个判断view 距离y的距离是根据返回的字符串高度来定义的
            //提示框的y轴位置
            CGFloat finalY = (mainScreenheight - 20 - stringSizeMult.height) * 0.8;
            
            //此View 显示的frame （包括边界）
            contentViewFrame = CGRectMake((mainScreenwidth - maxContentWith) * 0.5, finalY, maxContentWith, 20 + stringSizeMult.height);
            
            //此View的 初始位置
            [self setFrame:CGRectMake((mainScreenwidth - maxContentWith) * 0.5, finalY+30, maxContentWith, 20 + stringSizeMult.height)];
            
        }
        
        //此View的背景颜色
        //        self.backgroundColor = [UIColor blackColor];
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1];
        
        //添加文字说明
        UILabel *title = [[UILabel alloc] init];
        [self addSubview:title];
        [title setText:string];
        title.numberOfLines = 0;
        title.textColor = [UIColor whiteColor];
        //        [title setTextColor:RGB(220, 220, 220)];
        [title setFont:[UIFont systemFontOfSize:14]];
        if (stringSize.width <= maxContentWith){//如果是单行，剧中
            title.textAlignment = NSTextAlignmentCenter;
            
        }else{
            //NSTextAlignmentNatural
            /**
             NSTextAlignmentLeft 左对齐
             NSTextAlignmentCenter 剧中对齐
             NSTextAlignmentRight 右对齐
             NSTextAlignmentJustified 两端对齐
             NSTextAlignmentNatural 根据显示的文字特性对齐
             */
            title.textAlignment = NSTextAlignmentLeft;
        }
        
        
        self.title = title;
        
        
        CGRect titleFrame = self.bounds;//获取此View的bounds
        titleFrame.origin.x += 10; //距左边 10
        titleFrame.origin.y += 5; //距顶部 5
        titleFrame.size.width -= 20; // label 的宽度 比 此View -20 //前面有设置增大
        titleFrame.size.height -= 10; //
        [self.title setFrame:titleFrame];
        
        [self layerForViewWith:10 AndLineWidth:1.0];//此View切边，参数1：切圆 参数2：边框宽度
        
        //此View 添加到window
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        
        
        CGRect finalRect = contentViewFrame;//初始位置
        finalRect.origin.y += 5;//动画移动位置
        
        
        //移动的位置
        [UIView animateWithDuration:0.2 animations:^{
            [self setFrame:contentViewFrame];
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                [self setFrame:finalRect];
            }];
        }];
        
    }
    return self;
}

#pragma mark - 隐藏
- (void)finish
{
    self.hidden = YES;
    
    //    [self removeFromSuperview];
}


//计算一个label的大小,labelText 是字符串，postLabelMaxWidth是什么范围内的宽度，space 应该是nsstring距离label 的边界距离
-(CGSize)mCalculateVerticalSize:(NSString *)labelText postLabelMaxWidth:(CGFloat)postLabelMaxWidth font:(UIFont*)font defaultSpace:(CGFloat)space{
    
    //UIFont *font = [UIFont fontWithName:@"NotoSansHans-DemiLight" size:FONT_SIZE];
    NSDictionary *cellTextDic=nil;
    if (space!=0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:space];
        cellTextDic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    }else{
        cellTextDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    }
    
    
    //根据控件的大小和控件之间的距离，和手机屏幕的宽度，动态计算label的最长长度
    //int postLabelMaxWidth = [UIScreen mainScreen].bounds.size.width - 2*16;  //16是距离左右边框的距离
    CGSize labelSize = [labelText boundingRectWithSize:CGSizeMake(postLabelMaxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:cellTextDic context:nil].size;
    return  CGSizeMake(ceil(labelSize.width), ceil(labelSize.height));// labelSize;
    
    
    /**
     *
     */
}


@end
