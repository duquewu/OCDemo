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
#import <ASProgressPopUpView/ASProgressPopUpView.h>
#import <Masonry/Masonry.h>
@interface RACViewController ()
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString * name2;
@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    RAC(self.flag,on) = [RACSignal combineLatest:@[
//                                                   self.tf1.rac_textSignal,
//                                                   self.tf2.rac_textSignal,
//                                                   self.tf3.rac_textSignal,
//                                                   self.tf4.rac_textSignal,
//                                                   self.tf5.rac_textSignal,
//                                                   self.tf6.rac_textSignal]
//                                          reduce:^(NSString* tfStr1,NSString* tfStr2,NSString* tfStr3,
//                                                   NSString* tfStr4,NSString* tfStr5,NSString* tfStr6){
//                                        return @(tfStr1.length>0 && tfStr2.length>0 && tfStr3.length>0
//                                              && tfStr4.length>0 && tfStr5.length>0 && tfStr6.length>0);
//        
//    }];
    
    


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
//    UITextField * tf1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, 280, 44)];
//    tf1.borderStyle = UITextBorderStyleRoundedRect;
//    [self.view addSubview:tf1];
//    
//    
//    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, 280, 44)];
//    label1.backgroundColor = [UIColor colorWithWhite:0.77 alpha:1];
//    [self.view addSubview:label1];
//    
//
//    //RAC label的值=textfiled的值
//    [tf1.rac_textSignal  subscribeNext:^(id x) {
//        label1.text = x;
//    }];
//    [RACObserve(label1, text) subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    
//    [[RACSignal combineLatest:@[tf1.rac_textSignal,RACObserve(label1, text)] reduce:^id(NSString * tfText,NSString*labelText){
//        return @(tfText.length>0 && labelText.length>0);
//    }]subscribeNext:^(id x) {
//        NSLog(@"----%@",x);
//        swit.on = [x boolValue];
//    }];
//    // 钩子
//    [[self rac_signalForSelector:@selector(viewWillAppear:)]subscribeNext:^(id x) {
//        NSLog(@"viewWillAppear");
//    }];
//    [[self rac_signalForSelector:@selector(viewDidAppear:)]subscribeNext:^(id x) {
//        NSLog(@"viewDidAppear");
//    }];
//    
//
    
    NSTextAttachment * atta = [[NSTextAttachment alloc]init];
    atta.image = [UIImage imageNamed:@"1"];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30, 400, 80, 40)];
    [self.view addSubview:label];
//    label.text = @"123";
    NSMutableAttributedString * aStr = [[NSMutableAttributedString alloc]initWithString:@"444"];
    [aStr appendAttributedString:[NSAttributedString attributedStringWithAttachment:atta ]];
    label.attributedText = aStr;
}


+(NSDictionary*)testWithString:(NSString*)str  rangeValueAndAttributs:(NSDictionary*)attributes
{
    NSMutableDictionary * mDic = [NSMutableDictionary new];
    [mDic setObject:str forKey:@"string"];
    [attributes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mDic setValue:obj forKey:key];
    }];
    return mDic;
}

+(NSAttributedString*)attributeStringWithDic:(NSDictionary*)dic
{
    NSMutableAttributedString* mAttStr = [[NSMutableAttributedString alloc]initWithString:dic[@"string"]];
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([key isKindOfClass:[NSValue class]]) {
            key = (NSValue*)key;
            NSRange  r = [key rangeValue];
            [obj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [mAttStr addAttributes:obj range:r];
            }];
        }
    }];
    return mAttStr;
}

-(void)valueChanged:(UISlider*)slider
{
    ASProgressPopUpView* progress =(ASProgressPopUpView*) [self.view viewWithTag:200];
    progress.progress = slider.value;
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
