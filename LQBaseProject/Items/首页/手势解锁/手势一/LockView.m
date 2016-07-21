//
//  LockView.m
//  GCBWallet
//
//  Created by yzr on 16/7/6.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LockView.h"
#import "LockBtn.h"
#define kheight [UIScreen mainScreen].bounds.size.height
#define BUTTON_COUNT 9
#define BUTTON_COL_COUNT 3

@interface LockView()

/** 已选择按钮数组 */
@property(nonatomic, strong) NSMutableArray *selectedButtons;

/** 触摸位置 */
@property(nonatomic, assign) CGPoint currentTouchLocation;

@end

@implementation LockView

/** 初始化数组 */
- (NSMutableArray *)selectedButtons {
    if (nil == _selectedButtons) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}

#pragma mark - 初始化方法
/** 使用文件初始化 */
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initView];
    }
    return self;
}

/** 使用代码初始化 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

/** 初始化view内的控件(按钮) */
- (void) initView {
    // 设置透明背景
    self.backgroundColor = [[UIColor alloc] initWithRed:1 green:1 blue:1 alpha:0];
    
    for (int i=0; i<BUTTON_COUNT; i++) {
        LockBtn *button = [LockBtn buttonWithType:UIButtonTypeCustom];
        
        // 设置指标tag，用来记录轨迹
        button.tag = i;
        
        // 加入按钮到lock view
        [self addSubview:button];
    }
}

/** 设置按钮位置尺寸 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 取出所有按钮
    for (int i=0; i<self.subviews.count; i++) {
        LockBtn *button = self.subviews[i];
        
        if (kheight==480) {
            CGFloat buttonWidth = 56;
            CGFloat buttonHeight = 56;
            // 此按钮所在列号
            int col = i % BUTTON_COL_COUNT;
            // 此按钮所在行号
            int row = i / BUTTON_COL_COUNT;
            // 等分水平多余空间，计算出间隙
            CGFloat marginX = (self.frame.size.width - BUTTON_COL_COUNT * buttonWidth) / (BUTTON_COL_COUNT + 1);
            CGFloat marginY = marginX;
            
            // x坐标
            CGFloat buttonX = marginX + col * (buttonWidth + marginX);
            // y坐标
            CGFloat buttonY = marginY + row * (buttonHeight + marginY);
            
            button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
            
        }else{
            CGFloat buttonWidth = 74;
            CGFloat buttonHeight = 74;
            // 此按钮所在列号
            int col = i % BUTTON_COL_COUNT;
            // 此按钮所在行号
            int row = i / BUTTON_COL_COUNT;
            // 等分水平多余空间，计算出间隙
            CGFloat marginX = (self.frame.size.width - BUTTON_COL_COUNT * buttonWidth) / (BUTTON_COL_COUNT + 1);
            CGFloat marginY = marginX;
            
            // x坐标
            CGFloat buttonX = marginX + col * (buttonWidth + marginX);
            // y坐标
            CGFloat buttonY = marginY + row * (buttonHeight + marginY);
            
            button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
            
        }
    }
}

#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self touchesMoved:touches withEvent:event];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    
    // 检测哪个按钮被点中了
    for (LockBtn *button in self.subviews) {
        
        // 如果触碰到了此按钮
        if (CGRectContainsPoint(button.touchFrame, touchLocation)) {
            button.selected = YES;
            
            // 如果此按钮没有被触碰过才进行处理
            if (![self.selectedButtons containsObject:button]) {
                // 加入到数组
                [self.selectedButtons addObject:button];
            }
        }
        
        // 当前触摸位置
        self.currentTouchLocation = touchLocation;
    }
    
    // 重绘
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  
    //释放时延迟清空
    [self performSelector:@selector(delayLoad) withObject:nil afterDelay:0.2];
}

-(void)delayLoad
{
    // 轨迹序列
    NSMutableString *passPath = [NSMutableString string];
    
    // 合成轨迹序列
    for (LockBtn *button in self.selectedButtons) {
        // 清除选中状态
        button.selected = NO;
        
        // 添加到轨迹序列
        [passPath appendFormat:@"%zd", button.tag];
    }
    if (_LineBack) {
        self.LineBack(passPath);
    }
    
    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(lockView:didFinishedWithPath:)]) {
        [self.delegate lockView:self didFinishedWithPath:passPath];
        
    }
    
    // 清除选中状态，发现这种方法在真机8.2系统中不能起作用
    [self.selectedButtons makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    
    // 清空数组
    [self.selectedButtons removeAllObjects];
    
    // 重绘
    [self setNeedsDisplay];

}
#pragma mark - 绘图方法
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 遍历已选择按钮数组
    for (int i=0; i<self.selectedButtons.count; i++) {
        LockBtn *button = self.selectedButtons[i];
        
        if (0 == i) {
            [path moveToPoint:button.center];
        } else {
            [path addLineToPoint:button.center];
        }
    }
    
    if (self.selectedButtons.count) {
        [path addLineToPoint:self.currentTouchLocation];
    }
    
    // 设置画笔
    [[UIColor colorWithRed:131/255.0 green:201/255.0 blue:246/255.0 alpha:1] set];
    [path setLineWidth:10];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinBevel];
    
    [path stroke];
}
@end
