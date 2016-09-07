//
//  LanguageChangeVC.m
//  LQBaseProject
//
//  Created by YZR on 16/9/3.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LanguageChangeVC.h"

@interface LanguageChangeVC ()

//中英文切换标题
@property (weak, nonatomic) IBOutlet UILabel *vTitleLabel;


@end

@implementation LanguageChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 中英文切换点击
- (IBAction)mChangeButtonClick:(UIButton *)sender {

    NSLog(@"输出切换后的语言 = %@",NSLocalizedString(@"名字",nil));
    //NSLocalizedString(@"名字",nil);
 
    self.vTitleLabel.text = NSLocalizedString(@"名字",nil);
    
}

@end


