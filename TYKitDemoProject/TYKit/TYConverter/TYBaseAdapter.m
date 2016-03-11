//
//  TYBaseAdapter.m
//  PlayApp
//
//  Created by 18m on 16/3/9.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYBaseAdapter.h"
#import "TYAdaperManager.h"

@implementation TYBaseAdapter
+ (TYBaseAdapter *)adaterWithDictionary:(NSDictionary *)data{
    TYBaseAdapter *adapter = [[TYBaseAdapter alloc]init];
    adapter.sourceData = data;
    return adapter;
}

- (id)targetData{
    return [[TYAdaperManager sharedInstance] dataWithAdapter:self];
}

- (id) handleData{
    return nil;
}
@end
