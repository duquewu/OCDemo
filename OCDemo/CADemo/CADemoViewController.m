//
//  CADemoViewController.m
//  OCDemo
//
//  Created by WuNan on 15/5/21.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "CADemoViewController.h"
#import "ClockView.h"
@interface CADemoViewController ()
@property (nonatomic,strong) ClockView * v1;
@end

@implementation CADemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _v1 = [ClockView new];
    _v1.bounds = CGRectMake(0, 0, 200, 200);
    _v1.center = self.view.center;
    [self.view addSubview:_v1];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(doTimer) userInfo:nil repeats:YES];
}
-(void)doTimer {
    _v1.dateTime = [NSDate date];
}

@end
