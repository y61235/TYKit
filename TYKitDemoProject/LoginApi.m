//
//  LoginApi.m
//  TYKitDemoProject
//
//  Created by 18m on 16/3/22.
//  Copyright © 2016年 18m. All rights reserved.
//

#import "LoginApi.h"

@implementation LoginApi{
    NSString *_username;
    NSString *_password;
}


- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/iphone/login";
}

- (TYRequestMethod)requestMethod {
    return TYRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"username": _username,
             @"password": _password
             };
}


// 校验返回的json 格式
- (id)jsonValidator {
    return @{
             @"userId": [NSNumber class],
             @"nick": [NSString class],
             };
}

@end
