//
//  NSString+TYExtend.h
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TYExtend)

- (NSString *)schema;
- (NSString *)host;
- (NSString *)preStrWithKey:(NSString *)key;
- (NSString *)lastStrWithKey:(NSString *)key;
- (NSString *)yearStrInDateWithFormat:(NSString *)format;
- (NSString *)monthStrInDateWithFormat:(NSString *)format;
- (NSString *)dayStrInDateWithFormat:(NSString *)format;
- (NSString *)md5;
- (BOOL)isIncludeSpecialCharact;
@end
