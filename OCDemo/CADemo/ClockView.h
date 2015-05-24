//
//  ClockView.h
//  OCDemo
//
//  Created by WuNan on 15/5/25.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockView : UIView
@property (nonatomic,strong) NSDate* dateTime;
@end
@interface ClockLayer : CAShapeLayer
@property (nonatomic,strong) CAShapeLayer * hourHand;
@property (nonatomic,strong) CAShapeLayer * minuteHand;
@property (nonatomic,strong) CAShapeLayer * secondHand;
-(void)refreshTime:(NSDate*)date;
@end