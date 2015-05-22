//
//  CADemoViewController.m
//  OCDemo
//
//  Created by WuNan on 15/5/21.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "CADemoViewController.h"

@interface CADemoViewController ()

@end

@implementation CADemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CALayer * layer1 = [[CALayer alloc]init];
//    layer1.backgroundColor = CGColorCreateCopyWithAlpha([UIColor redColor].CGColor, 0.2);
//    layer1.frame = CGRectMake(0, 0, 100, 100);
//    [self.view.layer addSublayer:layer1];
    UIView * v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
}


@end
