//
//  Adapt.m
//  
//
//  Created by mac on 16/6/7.
//
//

#import "Adapt.h"

@implementation Adapt

+(CGFloat)FiveS_Up:(NSArray *)arr
{
    CGFloat afloat;
    
    if (arr.count == 3) {
        
        if ([UIScreen mainScreen].bounds.size.width == 320) {
            afloat = [arr[0] floatValue];
            
        }else if ([UIScreen mainScreen].bounds.size.width == 375) {
            afloat = [arr[1] floatValue];
        }else if ([UIScreen mainScreen].bounds.size.width == 414) {
            afloat = [arr[2] floatValue];
        }

        
    }
    
    
    return afloat;

}

+(CGFloat)setFiveToEight:(NSString *)str forArr:(NSArray *)arr
{
    
    CGFloat afloat;
    if (arr.count == 4) {
        
        if (str.length == 5) {
            afloat = [arr[0] floatValue];
            
        }else  if (str.length == 6) {
            afloat = [arr[1] floatValue];
            
        }else  if (str.length == 7) {
            afloat = [arr[2] floatValue];
            
        }else  if (str.length == 8) {
            afloat = [arr[3] floatValue];
            
        }
        
    }
    
    return afloat;
    
}

#pragma mark - 随机字符串
+ (NSString *)arcStr
{
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    int numberOfCharacters = (int)alphabet.length;
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    for (int i = 0; i < numberOfCharacters; ++i) {
        int j = (arc4random_uniform (numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    NSString *result = [NSString stringWithCharacters:characters length:numberOfCharacters];
    free(characters);
    return result;
}


@end
