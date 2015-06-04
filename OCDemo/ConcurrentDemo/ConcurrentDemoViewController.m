//
//  ConcurrentDemoViewController.m
//  OCDemo
//
//  Created by WuNan on 15/6/4.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "ConcurrentDemoViewController.h"

@interface ConcurrentDemoViewController ()
//{
//    dispatch_source_t timer;
//}
@end

@implementation ConcurrentDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //延时调用
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3ull * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"延时调用");
//    });
//    dispatch_queue_t sq1;
    //并行队列
    //1. 通过global_queue生成
//      sq1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //2. 手动生成
//    sq1 = dispatch_queue_create("com.xthd.sq1", DISPATCH_QUEUE_CONCURRENT);
    
    //串行队列
//    //1. 手动生成
//    sq1 = dispatch_queue_create("com.xthd.sq2", DISPATCH_QUEUE_SERIAL);
//    for (int i = 0; i<100; i++) {
//        if (i == 5) {
//            dispatch_barrier_async(sq1, ^{
//                NSLog(@"--------");
//            });
//        }
//        dispatch_async(sq1, ^{
//            NSLog(@"%d",i);
//        });
//    }

    
   dispatch_source_t timer =  [self timer];
//    CFRelease((__bridge CFTypeRef)timer);
//    dispatch_source_cancel(timer);
}

-(dispatch_source_t)timer{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"hello world");
    });
    dispatch_resume(timer);
    CFRetain((__bridge CFTypeRef)timer);
    return timer;
}

@end
