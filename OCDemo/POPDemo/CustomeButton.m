//
// Created by WuNan on 15/2/12.
// Copyright (c) 2015 信通惠德. All rights reserved.
//

#import "CustomeButton.h"
#import "pop/POP.h"

@implementation CustomeButton {

}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self add];
    }

    return self;
}
- (void) add {
    [self addTarget:self action:@selector(scale) forControlEvents:UIControlEventTouchUpInside];
}
-(void)scale {
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.springBounciness = 18;
    animation.springSpeed = 8;
    animation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    animation.autoreverses= YES;
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95, 0.95)];

    [self.layer pop_addAnimation:animation forKey:@"scale"];
}

@end