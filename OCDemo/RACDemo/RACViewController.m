//
//  RACViewController.m
//  OCDemo
//
//  Created by WuNan on 14/12/3.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//

#import "RACViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
@interface RACViewController ()
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString * name2;
@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    //信号过滤
//    RACSignal * signal =  RACObserve(self, name) ;
//    [[signal filter:^BOOL(id value) {
//        if ([value hasPrefix:@"张"])
//            return YES;
//        return NO;
//    }]subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//
//    self.name = @"zhangsan";
//    self.name = @"lisi";
//    self.name = @"张三";
//
//    //序列信号
    RACSequence * seq = [@[@"123",@"223"].rac_sequence map:^id(id value) {
        return [value stringByAppendingString:@"---"];
    }];
    [seq.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
//    //command等待被触发的signal, 当command被触发时,执行block;
//    //执行完成后需返回一个signal
//    RACCommand * command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
//        NSLog(@"%@",input);
//        NSLog(@"333");
//        return [RACSignal return:@"222"]; //相当于 sendNext
//    }];
//    [command.executing subscribeNext:^(id x) {
//        NSLog(@"executing..... -%@",x);
//    }];
//    //executionSignals command的block结束后执行此block,传递来的s为command block中返回的signal
//    [command.executionSignals subscribeNext:^(RACSignal* s) {
//        
//        [s subscribeNext:^(id x) {
//            NSLog(@"%@",x);
//        } completed:^{
//            NSLog(@"444");
//        }];
//    }];
//    //执行command
//    [command execute:@"123"];
//    
//    
//
}



@end
