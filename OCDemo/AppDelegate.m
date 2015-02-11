//
//  AppDelegate.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"[0-9]+.[0-9]{0,2}"];
    NSString * str1 = @"123.123";
    NSString * str2 = @"123.12";
    NSString * str3 = @"123.1";
    NSString * str4 = @"0.123";
    NSString * str5 = @"0.12";
    NSString * str6 = @"0.1";
    NSArray * arr = @[str1,str2,str3,str4,str5,str6];
    
    for (NSString * str in arr) {
        if([pre evaluateWithObject:str])
        {
            NSLog(@"%@ pass regex!",str);
        }
        else
        {
            NSLog(@"%@ not pass regex!",str);
        }
    }
    
    NSArray * arr2 = [@[@"Name",@"NaMe"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF LIKE[cd] %@",@"name"]];
    for (NSString* str in arr2) {
        NSLog(@"%@",str);
    }
   
 
    
    
    return YES;
}

@end
