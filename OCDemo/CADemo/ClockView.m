//
//  ClockView.m
//  OCDemo
//
//  Created by WuNan on 15/5/25.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "ClockView.h"
@interface ClockView ()
@property (nonatomic,strong)ClockLayer * clockLayer;
@end

@implementation ClockView

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _dateTime = [NSDate new];
        _clockLayer = [ClockLayer new];
        [self.layer addSublayer:_clockLayer];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _dateTime = [NSDate new];
        _clockLayer = [ClockLayer new];
        [self.layer addSublayer:_clockLayer];
    }
    return self;
}
-(void)setDateTime:(NSDate *)dateTime {
    _dateTime = dateTime;
    [self.clockLayer refreshTime:_dateTime];
}

@end


@implementation ClockLayer
-(instancetype)init {
    if (self = [super init]) {
        _hourHand = [CAShapeLayer new];
        _hourHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-3, -50, 6, 50)].CGPath;
        _hourHand.fillColor  = [UIColor blackColor].CGColor;
        _hourHand.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        [self addSublayer:_hourHand];
        _minuteHand = [CAShapeLayer new];
        _minuteHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-2, -70, 4, 70)].CGPath;
        _minuteHand.fillColor = [UIColor blackColor].CGColor;
        _minuteHand.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));

        [self addSublayer:_minuteHand];
        _secondHand = [CAShapeLayer new];
        _secondHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-1, -90, 2, 90)].CGPath;
        _secondHand.fillColor = [UIColor blackColor].CGColor;
        _secondHand.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));

        [self addSublayer:_secondHand];
        

    }
    return self;
}
-(void)refreshTime:(NSDate *)date {
    
    if (date) {
        NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents * components = [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:date];

        _hourHand.affineTransform = CGAffineTransformRotate(_hourHand.affineTransform, components.hour * M_PI *2 / 12);
        _minuteHand.affineTransform = CGAffineTransformRotate(_minuteHand.affineTransform, components.minute / 60 * M_PI*2);
        _secondHand.affineTransform = CGAffineTransformRotate(_secondHand.affineTransform, components.second / 60 * M_PI *2);

    }
}



@end