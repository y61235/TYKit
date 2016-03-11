//
//  TYTool.h
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYTool : NSObject
+ (void)hideAllKeyboard;
+ (NSString *)getCurTimeInterval;
+ (void)enterWithStoryboardName:(NSString *)name1 viewControllerName:(NSString *)name2;
@end
