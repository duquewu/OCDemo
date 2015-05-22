//
//  Person.h
//  OCDemo
//
//  Created by WuNan on 15/5/21.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import <Foundation/Foundation.h>
//Person 声明
@interface Person : NSObject
@property (nonatomic,copy) NSString* id;
@property (nonatomic,copy) NSString* password;
@property (nonatomic,copy) NSString* name;
//Dic-->Person
+(instancetype)personWithDic:(NSDictionary*)dic;
-(NSDictionary*)jsonDic;
//Action
-(Person*)create;
-(Person*)login;
@end

typedef void(^CreatePersonBlockSuccess)(Person* p);
typedef void(^CreatePersonBlockFailure)(NSError* err);
//PersonManager 声明
@interface PersonManager : NSObject
+(void)createWithPerson:(Person*)p complete:(CreatePersonBlockSuccess)successBlock error:(CreatePersonBlockFailure)failureBlock;
@end

//Person 实现
@implementation Person
-(Person *)createPerson {
    __block Person * person;
    __block NSError* error;
    [PersonManager createWithPerson:self complete:^(Person *p) {
        person = p;
    } error:^(NSError *err) {
        error = err;
    }];
    if (!error) {
        //错误处理
        return nil;
    }
    return person;
}
@end

//PersonManager实现
@implementation PersonManager

+(void)createWithPerson:(Person *)p complete:(CreatePersonBlockSuccess)successBlock error:(CreatePersonBlockFailure)failureBlock {
    //网络请求.
    
}

@end

