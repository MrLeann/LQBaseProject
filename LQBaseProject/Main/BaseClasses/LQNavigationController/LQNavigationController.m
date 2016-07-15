//
//  LQNavigationController.m
//  LQWeiXin
//
//  Created by YZR on 16/6/25.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LQNavigationController.h"

@interface LQNavigationController ()

@end

@implementation LQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

+ (void)initialize {
    /*! --- CONFIGURE THE VARIETY BAR'S PROPERTIES ---
     UINavigationBar *navBar = [UINavigationBar appearance];
     [navBar setBarTintColor:QLMainNavColor];
     [navBar setTintColor:[UIColor whiteColor]];
     [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
     
     UIBarButtonItem *barButtonItem = [UIBarButtonItem appearanceWhenContainedIn:[QLNavigationController class], nil];
     [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
     
     [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateDisabled];
     */
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count != 0) {//一级界面，不隐藏设置
        if (self.tabBarController.selectedIndex == 0) {//选中第一个TabBar时，
            viewController.hidesBottomBarWhenPushed = YES;
        }else if (self.tabBarController.selectedIndex == 1){
            viewController.hidesBottomBarWhenPushed = YES;
        }else if (self.tabBarController.selectedIndex == 2){
            //选中第三个时，不隐藏
            viewController.hidesBottomBarWhenPushed = YES;
        }else if (self.tabBarController.selectedIndex == 3){
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    [super pushViewController:viewController animated:animated];
}


@end
