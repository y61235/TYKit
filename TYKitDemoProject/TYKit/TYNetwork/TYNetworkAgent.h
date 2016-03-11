//
//  TYNetworkAgent.h
//  PlayApp
//
//  Created by 18m on 16/3/8.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYBaseRequest.h"

@interface TYNetworkAgent : NSObject
+ (TYNetworkAgent *)sharedInstance;

- (void)addRequest:(TYBaseRequest *)request;

- (void)cancelRequest:(TYBaseRequest *)request;

- (void)cancelAllRequests;
@end
