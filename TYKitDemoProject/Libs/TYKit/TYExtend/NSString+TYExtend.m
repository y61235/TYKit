//
//  NSString+TYExtend.m
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "NSString+TYExtend.h"
#import "CommonCrypto/CommonDigest.h"
#import "NSObject+TYExtend.h"

@implementation NSString (TYExtend)


- (NSString *)schema
{
    NSRange range = [self rangeOfString:@"://"];
    if (range.length == 0) return @"";
    
    NSString *schema = [self substringToIndex:range.location];
    return schema;
}

- (NSString *)host
{
    NSString *schema = self.schema;
    if (!schema.isNoEmpty) return @"";
    
    NSString *noSchema = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@://",schema] withString:@""];
    
    NSRange range = [noSchema rangeOfString:@"/"];
    if (range.length == 0) return noSchema;
    
    return [noSchema substringToIndex:range.location];
}

-(NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}


- (NSString *)preStrWithKey:(NSString *)key{
    NSRange range = [self rangeOfString:key];
    if (range.location != NSNotFound) {
        return [self substringToIndex:range.location];
    }
    return self;
}
- (NSString *)lastStrWithKey:(NSString *)key{
    NSRange range = [self rangeOfString:key];
    if (range.location != NSNotFound) {
        return [self substringFromIndex:range.location];
    }
    return self;
}

- (NSDate *) dateWithFormat:(NSString *)format{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate* date = [inputFormatter dateFromString:self];
    return date;
}


- (NSString *)yearStrInDateWithFormat:(NSString *)format{
    
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:format];
    
    NSDate* inputDate = [inputFormatter dateFromString:self];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *str = [inputFormatter stringFromDate:inputDate];
    
    return [str preStrWithKey:@"-"];
    
}
- (NSString *)monthStrInDateWithFormat:(NSString *)format{
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:format];
    
    NSDate* inputDate = [inputFormatter dateFromString:self];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *str = [inputFormatter stringFromDate:inputDate];
    
    NSString *str1 = [str lastStrWithKey:@"-"];
    return [str1 preStrWithKey:@"-"];
}
- (NSString *)dayStrInDateWithFormat:(NSString *)format{
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:format];
    
    NSDate* inputDate = [inputFormatter dateFromString:self];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *str = [inputFormatter stringFromDate:inputDate];
    
    NSString *str1 = [str lastStrWithKey:@"-"];
    return [str1 lastStrWithKey:@"-"];
}

-(BOOL)isIncludeSpecialCharact{
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [self rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"！!?. 。~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

-(BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
@end
