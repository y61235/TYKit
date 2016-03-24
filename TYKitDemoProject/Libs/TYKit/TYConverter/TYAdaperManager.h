//
//  TYAdaperManager.h
//  PlayApp
//
//  Created by 18m on 16/3/9.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYBaseAdapter.h"

@interface TYAdaperManager : NSObject

+ (TYAdaperManager *)sharedInstance;
- (id)dataWithAdapter:(TYBaseAdapter *)adapter;
@end
