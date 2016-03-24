//
//  TYNetworkConfig.m
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYNetworkConfig.h"

@implementation TYNetworkConfig

+ (id)sharedInstance
{
    static id this = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        this = [[self alloc] init];
    });
    return this;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
