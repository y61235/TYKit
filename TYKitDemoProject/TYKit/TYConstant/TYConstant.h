//
//  TYConstant.h
//  PlayApp
//
//  Created by 18m on 16/3/3.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#ifndef TYConstant_h
#define TYConstant_h


#define kRemoveSaveObject(key) \
[[NSUserDefaults standardUserDefaults] removeObjectForKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize]

// 本地存储信息
#define kGetUserSystemObject(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define kSaveUserSystemObject(key, value) \
[[NSUserDefaults standardUserDefaults] setObject:value forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]

#define kGetCustomObject(key, value) \
NSData *serialized = [[NSUserDefaults standardUserDefaults] objectForKey:key]; \
if(serialized){ \
value = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];\
}\
else{ \
value = nil; \
}

#define kSaveCustomObject(key, value)  do{\
NSData *serialized = [NSKeyedArchiver archivedDataWithRootObject:value];\
if(serialized){ \
[[NSUserDefaults standardUserDefaults] setObject:serialized forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]; \
}\
}\
while(0)

#ifdef DEBUG  // 调试状态
// 打开LOG功能

#define NSTYLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define NSTYLog(xx, ...)
#endif

#endif /* TYConstant_h */
