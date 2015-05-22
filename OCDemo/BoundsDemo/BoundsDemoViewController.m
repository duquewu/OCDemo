//
//  BoundsDemoViewController.m
//  OCDemo
//
//  Created by WuNan on 15/5/22.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "BoundsDemoViewController.h"

@interface BoundsDemoViewController ()

@end

@implementation BoundsDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * v1 = [[UIView alloc]initWithFrame:self.view.frame];
    v1.tag = 101;
    v1.backgroundColor = [UIColor yellowColor];
    v1.layer.masksToBounds=YES;
    UILabel * v2 =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 1000)];
    v2.backgroundColor = [UIColor redColor];
    v2.numberOfLines = 0;
    v2.text =@"1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40";
    [v1 addSubview:v2];
    NSLog(@"%@", NSStringFromCGRect(v1.bounds));
    [self.view addSubview:v1];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView * v1 = [self.view viewWithTag:101];
    CGRect bounds = CGRectMake(0,arc4random()%800, CGRectGetWidth(v1.bounds),CGRectGetHeight(v1.bounds));
    [UIView animateWithDuration:0.25 animations:^{
        v1.bounds = bounds;
    }completion:^(BOOL finished) {
        NSLog(@"%@", NSStringFromCGRect(v1.bounds));
    }];
}


@end
