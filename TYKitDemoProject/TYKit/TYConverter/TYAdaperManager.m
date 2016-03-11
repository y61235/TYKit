//
//  TYAdaperManager.m
//  PlayApp
//
//  Created by 18m on 16/3/9.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYAdaperManager.h"

@implementation TYAdaperManager

+ (TYAdaperManager *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)dataWithAdapter:(TYBaseAdapter *)adapter{
    return [adapter handleData];
}

@end
