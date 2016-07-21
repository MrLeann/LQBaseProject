//
//  BAButtonViewController.m
//  LQBaseProject
//
//  Created by YZR on 16/7/21.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "BAButtonViewController.h"
#import "BAButton.h"

@interface BAButtonViewController ()

@end

@implementation BAButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mInitUI];
    
}

//
-(void)mInitUI{
    
//    /**   按钮一  */
//    BACustomButton *btn = [BACustomButton BA_ShareButton];
//    btn.backgroundColor = [UIColor greenColor];;
//    [btn setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn setTitle:@"系统默认样式" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn.buttonStatus = BAAligenmentStatusNormal;
//    btn.buttonCornerRadius = 5.0;
//    btn.frame = CGRectMake(50, 74, 200, 50);
//    /*! 文字和图片的间距用这两行代码更改就行了 */
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, btn.titleLabel.frame.size.width+5);
//    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
//    btn.titleLabel.textAlignment = NSTextAlignmentRight;
//    [self.view addSubview:btn];
    
    /**   按钮二  */
    BACustomButton *btn1 = [BACustomButton BA_ShareButton];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
    [btn1 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.buttonStatus = BAAligenmentStatusLeft;
    btn1.buttonCornerRadius = 5.0;
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    btn1.frame = CGRectMake(50, 74+10+200, 200, 50);
    [self.view addSubview:btn1];
    
    
//    /**   按钮三  */
//    BACustomButton *btn2 = [BACustomButton BA_ShareButton];
//    [btn2 setBackgroundColor:[UIColor greenColor]];
//    [btn2 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn2 setTitle:@"中心对齐[文字左图片右]" forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn2.buttonStatus = BAAligenmentStatusCenter;
//    btn2.buttonCornerRadius = 5.0;
//    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
//    btn2.frame = CGRectMake(50, 74+10+200+200 + 10, 300, 50);
//    [self.view addSubview:btn2];
//    
//    /**   按钮四  */
//    BACustomButton *btn3 = [BACustomButton BA_ShareButton];
//    [btn3 setBackgroundColor:[UIColor greenColor]];
//    [btn3 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn3 setTitle:@"右对齐[文字左图片右]" forState:UIControlStateNormal];
//    btn3.titleLabel.font = [UIFont systemFontOfSize:10];
//    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn3.buttonStatus = BAAligenmentStatusRight;
//    btn3.buttonCornerRadius = 5.0;
//    btn3.frame = CGRectMake(50, 74+10+200+200+10+300, 200, 50);
//    [self.view addSubview:btn3];
//    
//    /**   按钮五  */
//    BACustomButton *btn4 = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusLeft];
//    [btn4 setBackgroundColor:[UIColor greenColor]];
//    [btn4 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn4 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
//    btn4.titleLabel.font = [UIFont systemFontOfSize:10];
//    btn4.buttonCornerRadius = 5.0;
//    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn4.frame = CGRectMake(50, 74+10+200+200+10+300+200, 200, 50);
//    [self.view addSubview:btn4];
//    
//    /**   按钮六  */
//    BACustomButton *btn5 = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusTop];
//    [btn5 setBackgroundColor:[UIColor greenColor]];
//    [btn5 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn5 setTitle:@"图片在上，文字在下" forState:UIControlStateNormal];
//    btn5.titleLabel.font = [UIFont systemFontOfSize:10];
//    btn5.buttonCornerRadius = 5.0;
//    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn5.frame = CGRectMake(50, 74+10+200+200+10+300+200+200, 200, 80);
//    [self.view addSubview:btn5];
//    
//    /**   按钮七  */
//    BACustomButton *btn6 = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusBottom];
//    [btn6 setBackgroundColor:[UIColor greenColor]];
//    [btn6 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn6 setTitle:@"图片在下，文字在上" forState:UIControlStateNormal];
//    btn6.titleLabel.font = [UIFont systemFontOfSize:10];
//    btn6.buttonCornerRadius = 5.0;
//    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn6.frame = CGRectMake(50, 74+10+200+200+10+300+200+200+200, 150, 80);
//    [self.view addSubview:btn6];
//    
//    /**   按钮八  */
//    BACustomButton *btn7 = [[BACustomButton alloc] init];
//    btn7.buttonStatus = BAAligenmentStatusBottom;
//    [btn7 setBackgroundColor:[UIColor greenColor]];
//    [btn7 setImage:[UIImage imageNamed:@"picture@2x"] forState:UIControlStateNormal];
//    [btn7 setTitle:@"图片在下，文字在上" forState:UIControlStateNormal];
//    btn7.titleLabel.font = [UIFont systemFontOfSize:13];
//    btn7.buttonCornerRadius = 5.0;
//    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn7.frame = CGRectMake(50, 74+10+200+200+10+300+200+200+200+200, 150, 80);
//    [self.view addSubview:btn7];

}

@end
