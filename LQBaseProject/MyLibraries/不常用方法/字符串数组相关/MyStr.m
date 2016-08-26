//
//  MyStr.m
//  virtualdeal
//
//  Created by yzr on 16/6/17.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "MyStr.h"

@implementation MyStr

+(NSString *)str:(id)str
{
    NSString *string = [NSString stringWithFormat:@"%@",str];
    
    
  return string;
    
}

+(NSString *)dStr:(NSInteger)str
{
    return [NSString stringWithFormat:@"%zd",str];
}

+(NSString *)fStr:(id)str
{
    NSString *string = [NSString stringWithFormat:@"%@",str];
    if ([string floatValue] > 0) {
        return [NSString stringWithFormat:@"%.2f",[string floatValue]];
    }
    
    return @"0.00";
}

+(NSString *)tStr:(id)str
{
    NSString *string = [NSString stringWithFormat:@"%@",str];
    string = [string stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    
    return [string substringWithRange:NSMakeRange(0, 19)];
}


+(BOOL)isNull:(id)str
{
    BOOL is = NO;
    
    if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"]) {
        is = YES;
    }
    
    return is;
}

+(NSString *)dateAllStr:(id)str
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *timeStr = [NSString stringWithFormat:@"%f",[str floatValue]/1000];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeStr doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    
    return dateString;
}


+(NSString *)nonnullStr:(id)str
{
    if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"]) {
        return @"后台没加 !!";
    }else if ([[NSString stringWithFormat:@"%@",str] isEqualToString:@"null"])
    {
        return @"key错了!!";
    }
    return str;
}

+(NSString *)zeroStr:(id)str
{
    NSString *string = [NSString stringWithFormat:@"%@",str];
    
    if ([string isEqualToString:@"(null)"]) {
        return @"";
    }
    
    return string;
}



@end
