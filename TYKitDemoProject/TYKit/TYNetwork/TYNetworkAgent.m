//
//  TYNetworkAgent.m
//  PlayApp
//
//  Created by 18m on 16/3/8.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYNetworkAgent.h"
#import "TYNetworkUtil.h"
#import "TYNetworkConfig.h"
#import "AFDownloadRequestOperation.h"
#import "AFNetworking.h"

@implementation TYNetworkAgent{
    AFHTTPRequestOperationManager *_manager;
    TYNetworkConfig *_config;
    NSMutableDictionary *_requestsRecord;
}

+ (TYNetworkAgent *)sharedInstance {
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
        _config = [TYNetworkConfig sharedInstance];
        _manager = [AFHTTPRequestOperationManager manager];
        _requestsRecord = [NSMutableDictionary dictionary];
        _manager.operationQueue.maxConcurrentOperationCount = 4;
        _manager.securityPolicy = _config.securityPolicy;
    }
    return self;
}

- (NSString *)buildRequestUrl:(TYBaseRequest *)request {
    NSString *detailUrl = [request requestUrl];
    if ([detailUrl hasPrefix:@"http"]) {
        return detailUrl;
    }
    // filter url
    NSArray *filters = [_config urlFilters];
    for (id<TYUrlFilterProtocol> f in filters) {
        detailUrl = [f filterUrl:detailUrl withRequest:request];
    }
    
    NSString *baseUrl;
    if ([request useCDN]) {
        if ([request cdnUrl].length > 0) {
            baseUrl = [request cdnUrl];
        } else {
            baseUrl = [_config cdnUrl];
        }
    } else {
        if ([request baseUrl].length > 0) {
            baseUrl = [request baseUrl];
        } else {
            baseUrl = [_config baseUrl];
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
}

- (void)addRequest:(TYBaseRequest *)request{
    TYRequestMethod method = [request requestMethod];
    NSString *url = [self buildRequestUrl:request];
    
    id param = request.requestArgument;
    AFConstructingBlock constructingBlock = [request constructingBodyBlock];
    
    if (request.requestSerializerType == TYRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else if(request.requestSerializerType == TYRequestSerializerTypeJSON){
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    
    NSArray *authorizationHeaderFieldArray = [request requestAuthorizationHeaderFieldArray];
    if (authorizationHeaderFieldArray != nil) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:(NSString *)authorizationHeaderFieldArray.firstObject
                                                                   password:(NSString *)authorizationHeaderFieldArray.lastObject];
    }
    
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            }else{
                NSTYLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    NSURLRequest *customUrlRequest = [request buildCustomUrlRequest];
    
    if(customUrlRequest){
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:customUrlRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self handleRequestResult:operation];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self handleRequestResult:operation];
        }];
    }
}

- (void)handleRequestResult:(AFHTTPRequestOperation *)operation {
    
}

@end
