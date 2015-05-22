//
//  AppDelegate.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//
#import "RootViewController.h"
#import "AppDelegate.h"

#import <objc/runtime.h>
@interface UIView (Test)
@property (nonatomic,copy)NSString* name;
@end

@implementation UIView (Test)
-(void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY);
}
-(NSString *)name {
       NSString* name = objc_getAssociatedObject(self, @selector(name));
//    if (name == nil) {
//        return nil;
//    }
    return name;
}

@end
@implementation AppDelegate

-(void)applicationDidFinishLaunching:(UIApplication *)application {
    UIView * v = [UIView new];
//    v.name = @"123";
    NSLog(@"%@",v.name);
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];

    RootViewController * root = [RootViewController new];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:root];
    [self.window setRootViewController:nav];

    [[UINavigationBar appearance]setTranslucent:NO];

}

@end
