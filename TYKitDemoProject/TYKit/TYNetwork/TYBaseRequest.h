//
//  TYBaseRequest.h
//  PlayApp
//
//  Created by 18m on 16/3/7.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFDownloadRequestOperation.h"

typedef NS_ENUM(NSInteger , TYRequestMethod) {
    TYRequestMethodGet = 0,
    TYRequestMethodPost,
    TYRequestMethodHead,
    TYRequestMethodPut,
    TYRequestMethodDelete,
    TYRequestMethodPatch
};

typedef NS_ENUM(NSInteger , TYRequestSerializerType) {
    TYRequestSerializerTypeHTTP = 0,
    TYRequestSerializerTypeJSON,
};

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);
typedef void (^AFDownloadProgressBlock)(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile);

@class TYBaseRequest;

typedef void(^TYRequestCompletionBlock)(__kindof TYBaseRequest *request);

@protocol TYRequestDelegate <NSObject>

@optional
- (void)requestFinished:(TYBaseRequest *)request;
- (void)requestFailed:(TYBaseRequest *)request;
- (void)clearRequest;

@end

@interface TYBaseRequest : NSObject

@property (nonatomic) NSInteger tag;

@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;

/// request delegate object
@property (nonatomic, weak) id<TYRequestDelegate> delegate;

@property (nonatomic, strong, readonly) NSDictionary *responseHeaders;

@property (nonatomic, strong, readonly) NSData *responseData;

@property (nonatomic, strong, readonly) NSString *responseString;

@property (nonatomic, strong, readonly) id responseJSONObject;

@property (nonatomic, readonly) NSInteger responseStatusCode;

@property (nonatomic, copy) TYRequestCompletionBlock successCompletionBlock;

@property (nonatomic, copy) TYRequestCompletionBlock failureCompletionBlock;

@property (nonatomic, strong) NSMutableArray *requestAccessories;

- (void)start;

- (void)stop;

- (BOOL)isExecuting;

/// block回调
- (void)startWithCompletionBlockWithSuccess:(TYRequestCompletionBlock)success
                                    failure:(TYRequestCompletionBlock)failure;

- (void)setCompletionBlockWithSuccess:(TYRequestCompletionBlock)success
                              failure:(TYRequestCompletionBlock)failure;

/// 避免循环引用
- (void)clearCompletionBlock;

/// 以下方法由子类继承自定义值

/// 请求成功的回调
- (void)requestCompleteFilter;

/// 请求失败的回调
- (void)requestFailedFilter;

/// 请求的URL
- (NSString *)requestUrl;

/// 请求的CdnURL
- (NSString *)cdnUrl;

/// 请求的BaseURL
- (NSString *)baseUrl;

/// 请求的连接超时时间，默认为60秒
- (NSTimeInterval)requestTimeoutInterval;

/// 请求的参数列表
- (id)requestArgument;

/// 用于在cache结果，计算cache文件名时，忽略掉一些指定的参数
- (id)cacheFileNameFilterForRequestArgument:(id)argument;

/// Http请求的方法
- (TYRequestMethod)requestMethod;

/// 请求的SerializerType
- (TYRequestSerializerType)requestSerializerType;

/// 请求的Server用户名和密码
- (NSArray *)requestAuthorizationHeaderFieldArray;

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary;

/// 构建自定义的UrlRequest，
/// 若这个方法返回非nil对象，会忽略requestUrl, requestArgument, requestMethod, requestSerializerType
- (NSURLRequest *)buildCustomUrlRequest;

/// 是否使用CDN的host地址
- (BOOL)useCDN;

/// 用于检查JSON是否合法的对象
- (id)jsonValidator;

/// 用于检查Status Code是否正常的方法
- (BOOL)statusCodeValidator;

/// 当POST的内容带有文件等富文本时使用
- (AFConstructingBlock)constructingBodyBlock;

/// 当需要断点续传时，指定续传的地址
- (NSString *)resumableDownloadPath;

/// 当需要断点续传时，获得下载进度的回调
- (AFDownloadProgressBlock)resumableDownloadProgressBlock;
@end
