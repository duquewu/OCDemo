//
//  DrawViewController.m
//  OCDemo
//
//  Created by WuNan on 15/3/23.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "DrawViewController.h"
@interface DrawViewController()
{
    UIImage* _myImage;
    CAShapeLayer* bgPath;
}
@end
@implementation DrawViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    //创建一个
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    
//    CGContextMoveToPoint(context, self.view.center.x, self.view.center.y);
//    CGContextAddArc(context, self.view.center.x, self.view.center.y, 160, 0, 1.5*M_PI, NO);
//    CGContextClosePath(context);
//    
//    //    CGContextFillPath(context);
//    CGContextStrokePath(context);
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors[] =
//    {
//        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
//        133.0 / 255.0, 224.0 / 255.0, 211.0 / 255.0, 1.00,
//        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
//        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
//    };
//    //    CGFloat locations[] = {
//    //
//    //    };
//    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/sizeof(colors[0]));
//    CGColorSpaceRelease(rgb);
////    CGContextDrawLinearGradient(context, gradient, self.view.center, CGPointApplyAffineTransform(self.view.center, CGAffineTransformMakeTranslation(0, 500)), 0);
//        CGContextDrawRadialGradient(context, gradient, self.view.center, 10, CGPointMake(320, self.view.center.y), 200, 0);
//    
//    _myImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIView * v = [[UIImageView alloc]initWithImage:_myImage];
//    [v setContentMode:UIViewContentModeBottomRight];
//    [self.view addSubview:v];
//    


    bgPath = [[CAShapeLayer alloc]init];
    bgPath.backgroundColor= [UIColor redColor].CGColor;
//    bgPath.frame = self.view.frame;
    bgPath.bounds = CGRectMake(0, 0, 200, 200);
    bgPath.position = self.view.center;
    UIBezierPath * path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(bgPath.bounds.size.width/2, bgPath.bounds.size.height/2)  radius:100 startAngle:M_PI_4 endAngle:3*M_PI_4 clockwise:NO];


    bgPath.path = path1.CGPath;
    bgPath.fillColor = [UIColor clearColor].CGColor;
    bgPath.strokeColor = [UIColor grayColor].CGColor;
    bgPath.lineWidth = 3;


    [self.view.layer addSublayer:bgPath];
    
}
-(void)animationDidStart:(CAAnimation *)anim {
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    bgPath.strokeEnd = arc4random()%100/100.0;
}
@end
