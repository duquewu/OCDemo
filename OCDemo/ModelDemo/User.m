//
//  User.m
//  Demos
//
//  Created by WuNan on 15/3/13.
//  Copyright (c) 2015年 吴 楠. All rights reserved.
//

#import "User.h"

@implementation User


+(NSDictionary*)JSONKeyPathsByPropertyKey{
    
    return @{
             @"id":@"id",
             @"screen_name":@"screen_name",
             @"name":@"name",
             @"url":@"url",
             @"profile_image_url":@"profile_image_url"
             };
}
+(NSValueTransformer*)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
+(NSValueTransformer *)profile_image_urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
@end
