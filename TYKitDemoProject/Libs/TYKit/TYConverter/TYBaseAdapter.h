//
//  TYBaseAdapter.h
//  PlayApp
//
//  Created by 18m on 16/3/9.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYBaseAdapter : NSObject

@property (nonatomic, strong) NSDictionary *sourceData;

+ (TYBaseAdapter *)adapterWithDictionary:(NSDictionary *)data;

- (id)targetData;

/// for subclasses to overwrite
- (id) handleData;
@end
