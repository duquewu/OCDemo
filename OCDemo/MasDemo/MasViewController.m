//
//  MasViewController.m
//  OCDemo
//
//  Created by WuNan on 15/5/22.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "MasViewController.h"
#import <Masonry/Masonry.h>
#import <JHChainableAnimations/JHChainableAnimations.h>
@interface MasViewController ()

@end

@implementation MasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * v1 = [UIView new];
    v1.tag = 101;
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.equalTo(self.view).offset(15);
        make.leading.equalTo(self.view).offset(20);
    }];



}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView * v1 = [self.view viewWithTag:101];
    [self updateFrameWithView:v1];
    [UIView animateWithDuration:0.15 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        UIBezierPath * path1 = [[UIBezierPath alloc]init];
        [path1 addArcWithCenter:CGPointMake(200, 200) radius:5 startAngle:0 endAngle:0.3 clockwise:YES];
        [path1 addLineToPoint:CGPointMake(100, 100)];
        [path1 closePath];
//        v1.moveOnPath(path1).animate(0.3);
    }];
}
-(void)updateFrameWithView:(UIView*)view{
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(arc4random()%200);
        make.leading.equalTo(self.view).offset(arc4random()%200);
        make.size.mas_equalTo(CGSizeMake(arc4random()%200, arc4random()%200));
    }];
}

@end
