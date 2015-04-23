//
//  ScrollDemoViewController.m
//  OCDemo
//
//  Created by WuNan on 15/4/17.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "ScrollDemoViewController.h"
@interface ScrollDemoViewController ()
@end

@implementation ScrollDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.scrollView setContentSize:CGSizeMake(320, 1000)];
    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
