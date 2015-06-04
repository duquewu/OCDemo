//
//  AppDelegate.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//
#import "RootViewController.h"
#import "AppDelegate.h"


@implementation AppDelegate

-(void)applicationDidFinishLaunching:(UIApplication *)application {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];

    RootViewController * root = [RootViewController new];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:root];
    [self.window setRootViewController:nav];

    [[UINavigationBar appearance]setTranslucent:NO];
}

@end
