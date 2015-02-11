//
//  TestViewController.h
//  OCDemo
//
//  Created by WuNan on 15/2/10.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController
- (IBAction)doButton:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end
