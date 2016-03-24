//
//  UserInfoAdapter.m
//  TYKitDemoProject
//
//  Created by 18m on 16/3/22.
//  Copyright © 2016年 18m. All rights reserved.
//

#import "UserInfoAdapter.h"
#import "UserInfo.h"

@implementation UserInfoAdapter

+ (UserInfoAdapter *)adapterWithDictionary:(NSDictionary *)data{
    return (UserInfoAdapter *)[TYBaseAdapter adapterWithDictionary:data];
}

- (id) handleData{
    UserInfo *model = [[UserInfo alloc]init];
    model.nick = [self.sourceData objectForKey:@"nick"];
    return model;
}
@end
