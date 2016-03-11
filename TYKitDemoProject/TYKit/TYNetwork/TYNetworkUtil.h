//
//  TYNetworkUtil.h
//  PlayApp
//
//  Created by 18m on 16/3/8.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYBaseRequest.h"

#ifdef DEBUG  // 调试状态
// 打开LOG功能

#define NSTYLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define NSTYLog(xx, ...)
#endif

@interface TYNetworkUtil : NSObject


+ (BOOL)checkJson:(id)json withValidator:(id)validatorJson;

+ (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString
                          appendParameters:(NSDictionary *)parameters;

+ (void)addDoNotBackupAttribute:(NSString *)path;   // 标记不备份文件

+ (NSString *)md5StringFromString:(NSString *)string;

+ (NSString *)appVersionString;

@end
