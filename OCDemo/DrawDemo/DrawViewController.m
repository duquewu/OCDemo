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
}
@end
@implementation DrawViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextMoveToPoint(context, self.view.center.x, self.view.center.y);
    CGContextAddArc(context, self.view.center.x, self.view.center.y, 160, 0, 1.5*M_PI, NO);
    CGContextClosePath(context);
    
    //    CGContextFillPath(context);
    CGContextStrokePath(context);
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        133.0 / 255.0, 224.0 / 255.0, 211.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
    };
    //    CGFloat locations[] = {
    //
    //    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/sizeof(colors[0]));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient, self.view.center, CGPointApplyAffineTransform(self.view.center, CGAffineTransformMakeTranslation(0, 500)), 0);
    //    CGContextDrawRadialGradient(context, gradient, self.view.center, 10, CGPointMake(320, self.view.center.y), 200, 0);
    
    _myImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIView * v = [[UIImageView alloc]initWithImage:_myImage];
    [v setContentMode:UIViewContentModeBottomRight];
    [self.view addSubview:v];
    //    UIImage * image = [UIImage imageNamed:@"1"];
    UIImage * image = [[UIImage imageNamed:@"1"]resizableImageWithCapInsets:UIEdgeInsetsMake(40, 40, 40, 40)];
    
    
    //    [self drawMe:0];
    
}

-(void)drawMe:(double)progress {
    CGImageRef image = CGImageRetain(_myImage.CGImage);
    double height = CGImageGetHeight(image);
    NSLog(@"%f",height);
    CGImageRelease(image);
}
@end
