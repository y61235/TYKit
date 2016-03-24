//
//  LoginApi.h
//  TYKitDemoProject
//
//  Created by 18m on 16/3/22.
//  Copyright © 2016年 18m. All rights reserved.
//

#import "TYRequest.h"

@interface LoginApi : TYRequest

- (id)initWithUsername:(NSString *)username password:(NSString *)password;
@end
