//
//  StatusCell.m
//  Demos
//
//  Created by WuNan on 15/3/16.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "StatusCell.h"
#import <UIImageView+AFNetworking.h>
@implementation StatusCell
-(void)setStatus:(Status *)status {
    self.sourceLabel.text = status.source;
    self.nameLabel.text = status.user.screen_name;
    self.statusTextLabel.text = status.text;
    [self.avatarImageView setImageWithURL:status.user.profile_image_url];
}
@end
