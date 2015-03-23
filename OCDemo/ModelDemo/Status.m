//
//  Status.m
//  Demos
//
//  Created by WuNan on 15/3/13.
//  Copyright (c) 2015年 吴 楠. All rights reserved.
//

#import "Status.h"

@implementation Status
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    //键---模型类的属性
    //值---Json中的键
    return @{
             @"created_at":@"created_at",
             @"id":@"id",
             @"text":@"text",
             @"source":@"source",
             @"favorited":@"favorited",
             @"truncated":@"truncated",
             @"user":@"user",
             @"avatarUrl":@"user.profile_image_url"
             };
}
//通配类型转换,推荐使用
+(NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    //根据key值判断
    if ([key isEqual:@"user"])
        return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:User.class];
    if ([key isEqual:@"avatarUrl"])
        return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
    return nil;
}
//单独设置转换类型,慎用
/**
 *  使用方式 属性名称+JSONTransformerForKey:(NSString *)key
 *  +(NSValueTransformer *)_propertyNameJSONTransformerForKey:(NSString *)key
 */
+(NSValueTransformer *)favoritedJSONTransformerForKey:(NSString *)key {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}
+(NSValueTransformer *)truncatedJSONTransformerForKey:(NSString *)key {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}
//此处无法将user属性进行转换，原因未知，暂时推荐使用通配类型转换
+(NSValueTransformer *)userJSONTransformerForKey:(NSString *)key {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:User.class];
}


@end
