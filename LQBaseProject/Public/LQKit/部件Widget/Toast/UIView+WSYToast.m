//
//  Xuebei
//
//  Created by maceasy on 15/11/25.
//  Copyright © 2015年 macHY. All rights reserved.
//

//定义toast的显示时间
#define seconds 1.5

#define LOGG(fmt, ...)do{\
NSString *file = [[NSString alloc]initWithFormat:@"%s",__FILE__];\
NSLog((@"<FILE:%@; LINE:%d;FUNC:%s>--:" fmt), [file lastPathComponent], __LINE__,__func__,##__VA_ARGS__);\
}while(0)

#define getString(fmt, ...)(\
NSString *file = [[NSString alloc]initWithFormat:@"%s",__FILE__];\
return (@"<FILE:%@; LINE:%d;FUNC:%s>--:" fmt), [file lastPathComponent], __LINE__,__func__,##__VA_ARGS__;\
)


#import "UIView+WSYToast.h"
#import "GlobalQueueOperation.h"
#import <objc/runtime.h>


static const void *toastViewKey = &toastViewKey;


@implementation UIView (WSYToast)

//下拉刷新
- (WSYToastView *) toastWithString:(NSString *)string
{
    WSYToastView *toastView = [WSYToastView toastWithString:string];
    self.toastView = toastView;
    return toastView;
}

- (void)setToastView:(WSYToastView *)toastView
{
    objc_setAssociatedObject(self, &toastViewKey,
                             toastView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (WSYToastView *)toastView
{
    return objc_getAssociatedObject(self, &toastViewKey);
}

- (void)toastShow:(NSString *)text
{

    if (text == nil || text.length == 0) {
        return;
    }else if (!self.toastView){
        
//        NSLog(@"输出无");
        
        doInDispatchSerialWith(^{
            doInMain(^{
                
                [self toastWithString:text];
            });
            sleep(seconds);
            doInMain(^{
                //消失
                [self.toastView finish];
            });
        });
    }else{
//        NSLog(@"输出有");
        if (self.toastView.hidden == YES) {
            doInDispatchSerialWith(^{
                doInMain(^{
                    
                    [self toastWithString:text];
                });
                sleep(seconds);
                doInMain(^{
                    //消失
                    [self.toastView finish];
                });
            });
        }
        
    }
}

@end
