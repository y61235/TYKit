//
//  TYNetworkConfig.h
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYBaseRequest.h"

@protocol TYUrlFilterProtocol <NSObject>
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(TYBaseRequest *)request;
@end

@protocol TYCacheDirPathFilterProtocol <NSObject>
- (NSString *)filterCacheDirPath:(NSString *)originPath withRequest:(TYBaseRequest *)request;
@end

@interface TYNetworkConfig : NSObject

@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSString *cdnUrl;
@property (strong, nonatomic, readonly) NSArray *urlFilters;
@property (strong, nonatomic, readonly) NSArray *cacheDirPathFilters;
@property (strong, nonatomic) AFSecurityPolicy *securityPolicy;

+ (TYNetworkConfig *)sharedInstance;

- (void)addUrlFilter:(id<TYUrlFilterProtocol>)filter;
- (void)addCacheDirPathFilter:(id <TYCacheDirPathFilterProtocol>)filter;

@end
