//
//  TYTool.m
//  PlayApp
//
//  Created by 18m on 16/3/4.
//  Copyright © 2016年 wutingyou. All rights reserved.
//

#import "TYTool.h"
#import "AppDelegate.h"

@implementation TYTool

+ (void)hideAllKeyboard{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

+ (void)enterWithStoryboardName:(NSString *)name1 viewControllerName:(NSString *)name2{
    UIWindow *window = [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"name1" bundle:nil];
    UIViewController *loginNav = [mainStoryboard instantiateViewControllerWithIdentifier:@"loginAndRegIden"];
    window.rootViewController = loginNav;
}

- (NSString *)getCurTimeInterval{
    NSDate *localDate = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[localDate timeIntervalSince1970]];
    return timeSp;
}
@end
