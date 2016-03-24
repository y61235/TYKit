//
//  TYRequest.h
//  PlayApp
//
//  Created by 18m on 16/3/8.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYBaseRequest.h"

@interface TYRequest : TYBaseRequest

@property (nonatomic) BOOL ignoreCache;

/// 返回当前缓存的对象
- (id)cacheJson;

/// 是否当前的数据从缓存获得
- (BOOL)isDataFromCache;

/// 返回是否当前缓存需要更新
- (BOOL)isCacheVersionExpired;

/// 强制更新缓存
- (void)startWithoutCache;

/// 手动将其他请求的JsonResponse写入该请求的缓存
- (void)saveJsonResponseToCacheFile:(id)jsonResponse;

/// For subclass to overwrite
- (NSInteger)cacheTimeInSeconds;
- (long long)cacheVersion;
- (id)cacheSensitiveData;

@end
