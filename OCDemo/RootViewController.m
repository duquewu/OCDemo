//
//  RootViewController.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//

#import "RootViewController.h"
#import "PopViewController.h"
#import "RACViewController.h"
#import "DrawViewController.h"
@interface RootViewController ()
{
    NSArray * _demosArr;
}
@end

@implementation RootViewController
#pragma mark- View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _demosArr = @[
                  [PopViewController new],
                  [RACViewController new],
                  [DrawViewController new],
                  ];
    
}

#pragma mark- Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _demosArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    const char*s = object_getClassName(_demosArr[indexPath.row]);
       NSString* className = NSStringFromClass([_demosArr[indexPath.row] class]);
//    cell.textLabel.text = [NSString stringWithCString:s encoding:NSUTF8StringEncoding];
    cell.textLabel.text = className;
    return cell;
}
#pragma mark- Table View Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController * viewController = _demosArr[indexPath.row];
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.navigationController.navigationBar.translucent=NO;
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
