//
//  NSArray+TYExtend.h
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TYExtend)

//防止越界
- (id)objectAtSafeIndex:(NSInteger)index;

//数字排序
- (NSArray *)sortedWithArray:(NSArray *)numbers;

//倒序数组
- (NSArray *)reverseForArray:(NSArray *)array;
@end
