//
//  ViewController.m
//  Demos
//
//  Created by WuNan on 15/3/15.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "StatusCell.h"
#import <AFNetworking/AFNetworking.h>
#import <Masonry/Masonry.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()
@property(nonatomic,copy)NSArray * statuses;
@end
#import "StatusCell.h"
//TableView类目
@interface ViewController (UITableView)<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));

    AFHTTPRequestOperationManager * manager =  [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.weibo.com/2/statuses/public_timeline.json" parameters:@{@"access_token":@"2.00evHF2Cpsho5Da79c7354e9rt9rRB"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.statuses = [MTLJSONAdapter modelsOfClass:Status.class fromJSONArray:responseObject[@"statuses"] error:nil];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
   
    
}

@end

#pragma mark TableView 类目

@implementation ViewController (UITableView)
-(CGFloat)heighForRowAtIndex:(NSInteger)index {
    
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heighForRowAtIndex:indexPath.row];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Status *s = self.statuses[indexPath.row];
    [cell setStatus:s];
    
    return cell;
}

@end


