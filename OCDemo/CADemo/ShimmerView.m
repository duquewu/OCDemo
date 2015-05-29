//
//  ShimmerView.m
//  OCDemo
//
//  Created by WuNan on 15/5/26.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "ShimmerView.h"
#import "UIBezierPath+TextPaths.h"
@interface ShimmerView()

@end

@implementation ShimmerView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
//        self.maskLayer = [[CALayer alloc]init];
//        self.maskLayer.bounds = CGRectMake(0, 0, frame.size.width/3, frame.size.height);
//        self.maskLayer.backgroundColor = [UIColor yellowColor].CGColor;
        //渐变蒙版
        CAGradientLayer * gradient = [[CAGradientLayer alloc]init];
        gradient.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        UIColor * color1 = (__bridge_transfer UIColor*)[[UIColor yellowColor] colorWithAlphaComponent:0.1].CGColor;
        UIColor * color2 = (__bridge_transfer UIColor*)[[UIColor blueColor] colorWithAlphaComponent:0.3].CGColor;
        UIColor * color3 = (__bridge_transfer UIColor*)[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        NSArray* colors = @[color1,color2,color3,color2,color1];
        NSArray* locations = @[@0.1,@0.3,@0.5,@0.7,@0.9];
        gradient.colors = colors;
        gradient.locations = locations;
        gradient.startPoint = CGPointMake(0, 0.5);
        gradient.endPoint = CGPointMake(1, 0.5);
        self.maskLayer = gradient;
        
        //文本层
//        CATextLayer * textLayer = [[CATextLayer alloc]init];
//        textLayer.frame = frame;
//        textLayer.string = @"hello world";
//        textLayer.foregroundColor = [UIColor blackColor].CGColor;
//        textLayer.fillMode = kCAFillRuleEvenOdd;
//        textLayer.mask = self.maskLayer;
//        [self.layer addSublayer:textLayer];
        //path文本
        UIBezierPath * path = [UIBezierPath pathForString:@"hello world" withFont:[UIFont fontWithName:@"Noteworthy-Bold" size:20]];
        CAShapeLayer * shapeLayer = [[CAShapeLayer alloc]init];
        shapeLayer.frame = frame;
        shapeLayer.lineWidth = 3;
//        shapeLayer.fillColor = [UIColor clearColor].CGColor;
//        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.path = path.CGPath;
        shapeLayer.bounds = CGPathGetBoundingBox(path.CGPath);
        shapeLayer.geometryFlipped = YES;
        shapeLayer.mask = _maskLayer;
        self.shapeLayer = shapeLayer;
        [self.layer addSublayer:shapeLayer];
        
    }
    return self;
}

@end
