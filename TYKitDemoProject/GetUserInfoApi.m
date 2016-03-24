//
//  GetUserInfoApi.m
//  TYKitDemoProject
//
//  Created by 18m on 16/3/22.
//  Copyright © 2016年 18m. All rights reserved.
//

#import "GetUserInfoApi.h"

@implementation GetUserInfoApi{
    NSString *_userId;
}


- (id)initWithUserId:(NSString *)userId {
    self = [super init];
    if (self) {
        _userId = userId;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/iphone/users";
}

- (id)requestArgument {
    return @{ @"id": _userId };
}

- (id)jsonValidator {
    return @{
             @"nick": [NSString class],
             };
}

- (NSInteger)cacheTimeInSeconds {
    return 60 * 3;
}
@end
