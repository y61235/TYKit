//
//  NSArray+TYExtend.m
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "NSArray+TYExtend.h"

@implementation NSArray (TYExtend)

- (id)objectAtSafeIndex:(NSInteger)index
{
    if (index >(self.count-1) || index < 0)
    {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

- (NSArray *)sortedWithArray:(NSArray *)numbers
{
    return  [numbers sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSComparisonResult result = NSOrderedSame;
        NSInteger value1 = [obj1 floatValue];
        NSInteger value2 = [obj2 floatValue];
        if (value1 > value2) {
            result =  NSOrderedDescending;
        } else if (value1 > value2) {
            result = NSOrderedSame;
        } else if (value1 > value2) {
            result =  NSOrderedDescending;
        }
        return result;
    }];
    
}

- (NSArray *)reverseForArray:(NSArray *)array
{
    return array.reverseObjectEnumerator.allObjects;
}

@end
