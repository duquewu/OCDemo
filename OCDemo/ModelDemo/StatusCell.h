//
//  StatusCell.h
//  Demos
//
//  Created by WuNan on 15/3/16.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Status.h"
@interface StatusCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusTextLabel;

-(void)setStatus:(Status*)status;

@end
