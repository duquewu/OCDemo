//
//  ShimmerView.h
//  OCDemo
//
//  Created by WuNan on 15/5/26.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShimmerView : UIView
@property (nonatomic,strong)CALayer * maskLayer;
@property (nonatomic,strong)CAShapeLayer* shapeLayer;
@end
