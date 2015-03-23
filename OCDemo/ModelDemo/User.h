//
//  User.h
//  Demos
//
//  Created by WuNan on 15/3/13.
//  Copyright (c) 2015年 吴 楠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@interface User : MTLModel<MTLJSONSerializing>
@property (nonatomic,copy,readonly)NSString * id;
@property (nonatomic,copy,readonly)NSString * screen_name;
@property (nonatomic,copy)NSString * name;
/**
 *  此处省略若干
 */
@property (nonatomic,copy,readonly)NSURL * url;
@property (nonatomic,copy,readonly)NSURL * profile_image_url;
@end
