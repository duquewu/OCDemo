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
@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(20, 80, 80, 44);
    [self.view addSubview:button1];
    button1.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"123");
        return [RACSignal empty];
    }];
    UISwitch * swit = [[UISwitch alloc] initWithFrame:CGRectMake(120, 80, 80, 44)];
    [self.view addSubview:swit];

    //信号过滤
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
    
    //序列信号
    RACSequence * seq = [@[@"123",@"223"].rac_sequence map:^id(id value) {
        return [value stringByAppendingString:@"---"];
    }];
    [seq.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
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
    
    
    
    UITextField * tf1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, 280, 44)];
    tf1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf1];
    
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, 280, 44)];
    label1.backgroundColor = [UIColor colorWithWhite:0.77 alpha:1];
    [self.view addSubview:label1];
    

    //RAC label的值=textfiled的值
    [tf1.rac_textSignal subscribeNext:^(id x) {
        label1.text = x;
    }];
    [RACObserve(label1, text) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [[RACSignal combineLatest:@[tf1.rac_textSignal,RACObserve(label1, text)] reduce:^id(NSString * tfText,NSString*labelText){
        return @(tfText.length>0 && labelText.length>0);
    }]subscribeNext:^(id x) {
        NSLog(@"----%@",x);
        swit.on = [x boolValue];
    }];
    // 钩子
    [[self rac_signalForSelector:@selector(viewWillAppear:)]subscribeNext:^(id x) {
        NSLog(@"viewWillAppear");
    }];
    [[self rac_signalForSelector:@selector(viewDidAppear:)]subscribeNext:^(id x) {
        NSLog(@"viewDidAppear");
    }];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self.view subviews]enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITextField class]]) {
            [obj resignFirstResponder];
        }
    }];
}
@end
