//
//  ReminderTableVIew.m
//  LQBaseProject
//
//  Created by YZR on 16/10/9.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "ReminderTableVIew.h"

@interface ReminderTableVIew ()

@end

@implementation ReminderTableVIew

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - 返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    return cell;
}

@end
