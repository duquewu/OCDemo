//
//  TestViewController.m
//  OCDemo
//
//  Created by WuNan on 15/2/10.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doButton:(id)sender {
    @try {
        NSDictionary * dic = NSDictionaryOfVariableBindings(sender,_segment);
        [self.view removeConstraints:self.view.constraints];
        [sender removeConstraints:[sender constraints]];
        [_segment removeConstraints:[_segment constraints]];
        
        NSString * vf1 = @"V:|-[sender(200)]-47-[_segment(80)]-|";
        NSString * vf2 = @"|-8-[sender(200)]-8-|";
//        NSString * vf3 = @"|-8-[_segment(>=200)]-8-|";
        NSArray * cons1 = [NSLayoutConstraint constraintsWithVisualFormat:vf1 options:0 metrics:nil views:dic];
        NSArray * cons2 = [NSLayoutConstraint constraintsWithVisualFormat:vf2 options:0 metrics:nil views:dic];
//        NSArray * cons3 = [NSLayoutConstraint constraintsWithVisualFormat:vf3 options:0 metrics:nil views:dic];
        [self.view addConstraints:cons1];
        [self.view addConstraints:cons2];
//        [self.view addConstraints:cons3];
        [UIView animateWithDuration:0.3 animations:^{
            [self.view updateConstraintsIfNeeded];

        }];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    
    
}
@end
