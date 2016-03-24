//
//  TYBaseRequest.m
//  PlayApp
//
//  Created by 18m on 16/3/7.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYBaseRequest.h"
#import "TYNetworkAgent.h"
//#import "TYNetworkTool.h"



@implementation TYBaseRequest


/// for subclasses to overwrite
- (void)requestCompleteFilter {
}

- (void)requestFailedFilter {
}

- (NSString *)requestUrl {
    return @"";
}

- (NSString *)cdnUrl {
    return @"";
}

- (NSString *)baseUrl {
    return @"";
}

- (NSTimeInterval)requestTimeoutInterval {
    return 60;
}

- (id)requestArgument {
    return nil;
}

- (id)cacheFileNameFilterForRequestArgument:(id)argument {
    return argument;
}

- (TYRequestMethod)requestMethod {
    return TYRequestMethodGet;
}

- (TYRequestSerializerType)requestSerializerType {
    return TYRequestSerializerTypeHTTP;
}

- (NSArray *)requestAuthorizationHeaderFieldArray {
    return nil;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return nil;
}

- (NSURLRequest *)buildCustomUrlRequest {
    return nil;
}

- (BOOL)useCDN {
    return NO;
}

- (id)jsonValidator {
    return nil;
}

- (BOOL)statusCodeValidator {
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    } else {
        return NO;
    }
}

- (AFConstructingBlock)constructingBodyBlock {
    return nil;
}

- (NSString *)resumableDownloadPath {
    return nil;
}

- (AFDownloadProgressBlock)resumableDownloadProgressBlock {
    return nil;
}

/// append self to request queue
- (void)start {
    [[TYNetworkAgent sharedInstance] addRequest:self];
}

/// remove self from request queue
- (void)stop {
    self.delegate = nil;
    [[TYNetworkAgent sharedInstance] cancelRequest:self];

}

- (BOOL)isExecuting {
    return self.requestOperation.isExecuting;
}

- (void)startWithCompletionBlockWithSuccess:(TYRequestCompletionBlock)success
                                    failure:(TYRequestCompletionBlock)failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)setCompletionBlockWithSuccess:(TYRequestCompletionBlock)success
                              failure:(TYRequestCompletionBlock)failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

- (void)clearCompletionBlock {
    // nil out to break the retain cycle.
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (id)responseJSONObject {
    return self.requestOperation.responseObject;
}

- (NSData *)responseData {
    return self.requestOperation.responseData;
}

- (NSString *)responseString {
    return self.requestOperation.responseString;
}

- (NSInteger)responseStatusCode {
    return self.requestOperation.response.statusCode;
}

- (NSDictionary *)responseHeaders {
    return self.requestOperation.response.allHeaderFields;
}



@end
