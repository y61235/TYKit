//
//  NSObject+TYExtend.m
//  PlayApp
//
//  Created by 18m on 16/3/23.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "NSObject+TYExtend.h"

@implementation NSObject (TYExtend)
- (BOOL)isNoEmpty
{
    if ([self isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if ([self isKindOfClass:[NSString class]])
    {
        return [(NSString *)self length] > 0;
    }
    else if ([self isKindOfClass:[NSData class]])
    {
        
        return [(NSData *)self length] > 0;
    }
    else if ([self isKindOfClass:[NSArray class]])
    {
        
        return [(NSArray *)self count] > 0;
    }
    else if ([self isKindOfClass:[NSDictionary class]])
    {
        
        return [(NSDictionary *)self count] > 0;
    }
    
    return YES;
}
@end
