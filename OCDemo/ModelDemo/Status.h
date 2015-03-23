//
//  Status.h
//  Demos
//
//  Created by WuNan on 15/3/13.
//  Copyright (c) 2015年 吴 楠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "User.h"
@interface Status : MTLModel<MTLJSONSerializing>
@property (nonatomic,copy)NSString * created_at;
@property (nonatomic,copy)NSString * id;
@property (nonatomic,copy)NSString * text;
@property (nonatomic,copy)NSString * source;
@property (nonatomic,copy)NSURL * avatarUrl;
@property (nonatomic,assign,readonly)BOOL favorited;
@property (nonatomic,assign,readonly)BOOL truncated;
@property (nonatomic,copy)User * user;
@end
