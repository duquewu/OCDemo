//
//  RACViewController.m
//  OCDemo
//
//  Created by WuNan on 14/12/3.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//

#import "RACViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface RACViewController ()
@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)UISwitch* on;
@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(80, 80, 80, 30);
    [self.view addSubview:button1];
    button1.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"123");
        return [RACSignal empty];
    }];
    
    
    RACSignal * signal =  RACObserve(self, name) ;
    [[signal filter:^BOOL(id value) {
        if ([value hasPrefix:@"张"])
            return YES;
        return NO;
    }]subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];

    self.name = @"zhangsan";
    self.name = @"lisi";
    self.name = @"张三";
    
    RACSequence * seq = [@[@"123",@"223"].rac_sequence map:^id(id value) {
        return [value stringByAppendingString:@"---"];
    }];
    [seq.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
    
    self.on = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    self.on.center = CGPointMake(200, 200);
    self.on.userInteractionEnabled=NO;
    [self.view addSubview:self.on];
    
    
    
    RAC(self.on,on) = [RACSignal combineLatest:@[seq.signal] reduce:^id{
        return @((arc4random()%2 == 0));
    }];
    
    //command等待被触发的signal, 当command被触发时,执行block;
    //执行完成后需返回一个signal
    RACCommand * command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"%@",input);
        NSLog(@"333");
        return [RACSignal return:@"222"]; //相当于 sendNext
    }];
    [command.executing subscribeNext:^(id x) {
        NSLog(@"executing..... -%@",x);
    }];
    //executionSignals command的block结束后执行此block,传递来的s为command block中返回的signal
    [command.executionSignals subscribeNext:^(RACSignal* s) {
        
        [s subscribeNext:^(id x) {
            NSLog(@"%@",x);
        } completed:^{
            NSLog(@"444");
        }];
    }];
    //执行command
    [command execute:@"123"];
}

@end
