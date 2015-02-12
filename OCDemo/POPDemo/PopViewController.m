//
//  PopViewController.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//

#import "PopViewController.h"
#import <pop/POP.h>
#import "CustomeButton.h"

@interface PopViewController ()
{
    BOOL _isMoved;
}
@end

@implementation PopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIView * v1 = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 50, 50)];
    v1.tag = 100;
    [v1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:v1];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(200, 300, 100, 40)];
//    label.text = @"100";
    label.tag = 101;
    [self.view addSubview:label];

    CustomeButton * button = [[CustomeButton alloc] init];
    button.frame= CGRectMake(200, 400, 100, 40);
    [button setBackgroundColor:[UIColor blueColor]];
    button.tag=102;
    [button setTitle:@"button" forState:UIControlStateNormal];
    [self.view addSubview:button];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.rowHeight=20;
    tableView.tag = 103;
    tableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tableView];
    UITapGestureRecognizer * gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:gestureRecognizer];

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doRight)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
-(void)doRight{
    UIView *v = [self.view viewWithTag:103];
    [v pop_removeAllAnimations];
    CGRect r1 = CGRectMake(400, 80, 0, 0);
    CGRect r2 = CGRectMake(100, 80, 200, 200);
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    animation.velocity = [NSValue valueWithCGRect:CGRectMake(0, 0, 5, 5)];
    animation.springSpeed=13;
    animation.springBounciness = 15;
    if (_isMoved){
        animation.fromValue = [NSValue valueWithCGRect:r2];
        animation.toValue = [NSValue valueWithCGRect:r1];
    }
    else {
        animation.fromValue = [NSValue valueWithCGRect:r1];
        animation.toValue = [NSValue valueWithCGRect:r2];
    }
    _isMoved = ! _isMoved;
    [v pop_addAnimation:animation forKey:@"test"];


}
-(void)tap:(NSObject*)sender
{
    _isMoved = !_isMoved;
    POPSpringAnimation * frameAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    frameAnimation.springBounciness = 15;
    frameAnimation.springSpeed = 20;

    POPBasicAnimation * colorAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    POPBasicAnimation *rotationAnimaiton = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];

    POPAnimatableProperty *animatableProperty = [POPAnimatableProperty propertyWithName:@"cont" initializer:^(POPMutableAnimatableProperty *prop) {
        [prop setReadBlock:^(id  obj, CGFloat values[]) {
            values[0] = [[obj description] floatValue];
        }];
        [prop setWriteBlock:^(id  label,const CGFloat values[]) {
            [label setText:[NSString stringWithFormat:@"%f",values[0]]];
        }];
    }];
    POPBasicAnimation *countAnimation = [POPBasicAnimation animation];
    countAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    countAnimation.duration=0.8;
    countAnimation.property=animatableProperty;
    countAnimation.fromValue=@10000;
    countAnimation.toValue=@0;



    if (_isMoved) {
        colorAnimation.fromValue = [UIColor redColor];
        colorAnimation.toValue = [UIColor blueColor];
        frameAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//        rotationAnimaiton.fromValue = @(M_PI/4);
        rotationAnimaiton.toValue = @(M_PI*2);
        scaleAnimation.toValue= [NSValue valueWithCGSize:CGSizeMake(0.8, 0.8)];
    }
    else{
//        rotationAnimaiton.fromValue = @(M_PI/3);
        scaleAnimation.toValue= [NSValue valueWithCGSize:CGSizeMake(1, 1)];

        rotationAnimaiton.toValue = @(M_PI*2);
        colorAnimation.toValue = [UIColor redColor];
        colorAnimation.fromValue = [UIColor blueColor];
        frameAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    }
    UIView * view = [self.view viewWithTag:100];
    [view pop_addAnimation:frameAnimation forKey:@"frame"];
    [view pop_addAnimation:colorAnimation forKey:@"color"];
    [view.layer pop_addAnimation:rotationAnimaiton forKey:@"rotation"];
    [view.layer pop_addAnimation:scaleAnimation forKey:@"scale"];

    UILabel *label = [self.view viewWithTag:101];
    [label pop_addAnimation:countAnimation forKey:@"count"];

}
@end
