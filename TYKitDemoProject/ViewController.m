//
//  ViewController.m
//  TYKitDemoProject
//
//  Created by 18m on 16/3/11.
//  Copyright © 2016年 18m. All rights reserved.
//

#import "ViewController.h"
#import "LoginApi.h"
#import "GetUserInfoApi.h"
#import "UserInfoAdapter.h"
#import "UserInfo.h"
#import "NSString+TYExtend.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *num = @"1213213";
    NSTYLog(@"isPureInt:%d", [num isPureInt]);
    
    NSString *str = @"66666y9999";
    [str preStrWithKey:@"y"];
    [str lastStrWithKey:@"y];"];
    ///............
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)login{
    LoginApi *api = [[LoginApi alloc] initWithUsername:@"username" password:@"password"];
    
    [api startWithCompletionBlockWithSuccess:^(__kindof TYBaseRequest *request) {
        NSTYLog(@"login success");
    }failure:^(__kindof TYBaseRequest *request) {
        NSTYLog(@"login failure");
    }];
}

- (void)userInfo{
    NSString *userId = @"1";
    GetUserInfoApi *api = [[GetUserInfoApi alloc] initWithUserId:userId];
    if ([api cacheJson]) {
        NSDictionary *json = [api cacheJson];
        NSLog(@"json = %@", json);
        
        UserInfoAdapter *adapter = [UserInfoAdapter adapterWithDictionary:json];
        
        UserInfo * userInfo = [adapter targetData];
        // 显示缓存数据
    }
    
    [api startWithCompletionBlockWithSuccess:^(__kindof TYBaseRequest *request) {
        
        NSTYLog(@"userInfo success");
    }failure:^(__kindof TYBaseRequest *request) {
        NSTYLog(@"userInfo failure");
    }];}

@end
