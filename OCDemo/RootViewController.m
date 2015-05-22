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
#import "ModelViewController.h"
#import "CADemoViewController.h"
#import "MasViewController.h"
#import "BoundsDemoViewController.h"
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
                  [PopViewController class],
                  [RACViewController class],
                  [DrawViewController class],
                  [ModelViewController class],
                  [CADemoViewController class],
                  [MasViewController class],
                  [BoundsDemoViewController class],
                  ];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark- Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _demosArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString* className = NSStringFromClass(_demosArr[indexPath.row]);
    cell.textLabel.text = className;
    return cell;
}
#pragma mark- Table View Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * viewController = [_demosArr[indexPath.row] new];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
