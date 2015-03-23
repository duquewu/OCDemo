//
//  AppDelegate.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>
#import "AppDelegate.h"
#import "BDCryptor.h"
#import "BDRSACryptorKeyPair.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"[0-9]+.[0-9]{0,2}"];
    NSString * str1 = @"123.123";
    NSString * str2 = @"123.12";
    NSString * str3 = @"123.1";
    NSString * str4 = @"0.123";
    NSString * str5 = @"0.12";
    NSString * str6 = @"0.1";
    NSArray * arr = @[str1,str2,str3,str4,str5,str6];
    
    for (NSString * str in arr) {
        if([pre evaluateWithObject:str])
        {
            NSLog(@"%@ pass regex!",str);
        }
        else
        {
            NSLog(@"%@ not pass regex!",str);
        }
    }
    
    NSArray * arr2 = [@[@"Name",@"NaMe"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF LIKE[cd] %@",@"name"]];
    for (NSString* str in arr2) {
        NSLog(@"%@",str);
    }
 
    
    BDRSACryptorKeyPair * keyPair = [[BDRSACryptorKeyPair alloc]initWithPublicKey:@"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDedFjyLcuvun9oZIQeLlWcyWqgY8R5P/6P9rmEz7Q68qWcZQsCgzY0q9XLwVJ9DfY6SA9uoX0u2ujv+j7WBXqrYmdvb4HYNytougaPLUZceOOQ3JKQsNBV6FgnUiKIqoROOK0o0MDKeFVC4Luj1c+mPFktBkGDoomKu0+CfibvWwIDAQAB-----END PUBLIC KEY-----" privateKey:@"-----BEGIN RSA PRIVATE KEY-----MIICXgIBAAKBgQDedFjyLcuvun9oZIQeLlWcyWqgY8R5P/6P9rmEz7Q68qWcZQsCgzY0q9XLwVJ9DfY6SA9uoX0u2ujv+j7WBXqrYmdvb4HYNytougaPLUZceOOQ3JKQsNBV6FgnUiKIqoROOK0o0MDKeFVC4Luj1c+mPFktBkGDoomKu0+CfibvWwIDAQABAoGBAIH4FCeanhDTs7C4WYCQrbBm9Yc0AwycWQyfqBBykeiG8D+JwX78TmVDqCvdjWZHC/9NLscCTvNbLxFWcfP1S49TfqMs/vT17RyTOo6Kyd8B8CxchBJhCArwwvGYLuwXU2PuWKJveBjBuI6bGJJsxVHKWsie7+3i5OWiQwYVfjgRAkEA9WbtrVMmASJHTOKzzG7jMlaji7D7qfXNw5MQTuQ/vips/+Pn8rTK2RycKTnhrJotOQkoaVqZm98jy4xsCnW9zQJBAOgPuCS3lPYeZshha+dAKWGew0VaGD+nTiU9GRPmocavyL14GH9piBgXlLv6foE/29TeeRF/vxj6wxl6KA8U+ccCQQDulky8N9v6PD6ABOTz/FdNqKhG9yImowGThNbVLNrAY3Un8IehE58oKMW22zyK2DbhfgLZMymnPvIJQxQDs2d9AkAa2c7FuNQskiH0Z4lTrZHcMMGJYb5Shyo8ltAzBEmNssM4YQ/8lhpgJ0JXacl/bQMjo0ZA5xYWbtVqOj8uV4/7AkEAjXxbldsOGqn8sCrpcwrpiGHwW6Ny3l2zDqvx31npwSxBQPdMia8jUudogn7PpCo/R+3sH8pVNVbge8F3EMtvzw==-----END RSA PRIVATE KEY-----"];
    
//    NSDictionary *dic = @{@"aaa":encodedStr};
    [[AFHTTPRequestOperationManager manager]
     POST:@"http://10.0.6.243:8080/xtApp/mobLogin/v2/checkMob?aaa=fZbYlaNXmVHM0n/bX2//aNSgI3X/VCu7mpZ/GzA7Ui7fUVwTDLUw5U+C0/odNJj3wmBYQ4/ReOLz85bSigNEVJRaGs5FwcIEWGM9oLQ32CfcA/g6szjtmD//z4kTOOvwRN9Q3+R/kUX/CO+4t7dD9deKXMfdzYHv8QdLkGKKzR0="
     parameters:nil
     constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"ewm" ofType:@"png"]] name:@"name" fileName:@"ewm.png" mimeType:@"image/png" error:nil];
        NSData *  data = UIImagePNGRepresentation([UIImage imageNamed:@"ewm"]);
         [formData appendPartWithFileData:data name:@"image" fileName:@"xiaojiuku.png" mimeType:@"image/png"];

    }
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    

    
    
    return YES;
}

@end
