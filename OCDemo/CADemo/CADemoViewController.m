//
//  CADemoViewController.m
//  OCDemo
//
//  Created by WuNan on 15/5/21.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "CADemoViewController.h"
#import "ClockView.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
#import "ShimmerView.h"
@interface CADemoViewController ()
@property (nonatomic,strong) ClockView * v1;
@property (nonatomic,strong) UIView * v2;
@end

@implementation CADemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _v1 = [ClockView new];
    _v1.bounds = CGRectMake(0, 0, 200, 200);
    _v1.center = self.view.center;
    
    [self.view addSubview:_v1];
    
//    _v2 = [UIView new];
//    _v2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_v2];
//    [_v2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(0);
//        make.top.mas_equalTo(0);
//        make.size.mas_equalTo(CGSizeMake(20, 20));
//    }];

    
    ShimmerView * shimmer = [[ShimmerView alloc]initWithFrame:_v1.frame];
    shimmer.tag = 100;
    [self.view addSubview:shimmer];
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(doTimer) userInfo:nil repeats:YES];
    
    
    [self.navigationController setViewControllers:@[[UIViewController new],[UIViewController new]] animated:YES];
}

//获取当前屏幕截图
-(UIImage *)getImageFromView:(UIView*)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
-(void)doTimer {
    _v1.dateTime = [NSDate date];
    CABasicAnimation * move = [CABasicAnimation animationWithKeyPath:@"position.x"];
    NSNumber * changeValue =@([move.fromValue floatValue]+arc4random()%100);
    move.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    move.fromValue = @(_v2.layer.position.x);
    move.toValue = @(_v2.layer.position.x+changeValue.floatValue);
    [_v2.layer addAnimation:move forKey:@"move"];
    _v2.center = CGPointMake(_v2.center.x+changeValue.floatValue, _v2.center.y);
    
    ShimmerView *shimer = (ShimmerView*)[self.view  viewWithTag:100];
       float random = arc4random()%200;
    shimer.maskLayer.position = CGPointMake(random, shimer.maskLayer.position.y);
}

@end
