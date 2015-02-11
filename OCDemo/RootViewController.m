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
#import "TestViewController.h"
#import <objc/runtime.h>
@interface RootViewController ()
{
    NSArray * _demosArr;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _demosArr = @[
                  [PopViewController new],
                  [RACViewController new],
                  [TestViewController new]];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _demosArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    const char*s = object_getClassName(_demosArr[indexPath.row]);
    cell.textLabel.text = [NSString stringWithCString:s encoding:NSUTF8StringEncoding];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * viewController = _demosArr[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
