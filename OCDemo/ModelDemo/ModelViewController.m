//
//  ViewController.m
//  Demos
//
//  Created by WuNan on 15/3/15.
//  Copyright (c) 2015年 信通惠德. All rights reserved.
//

#import "ModelViewController.h"
#import "Status.h"
#import "StatusCell.h"
#import <AFNetworking/AFNetworking.h>
#import <Masonry/Masonry.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ModelViewController ()
@property(nonatomic,copy)NSArray * statuses;
-(NSString*)idStr;
@end
#import "StatusCell.h"
//TableView类目
@interface ModelViewController (UITableView)<UITableViewDataSource,UITableViewDelegate>
@end

@implementation ModelViewController
-(NSString*)idStr {
    return NSStringFromClass([StatusCell class]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.tableView registerClass:NSClassFromString(self.idStr) forCellReuseIdentifier:self.idStr];
    ;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    AFHTTPRequestOperationManager * manager =  [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.weibo.com/2/statuses/public_timeline.json" parameters:@{@"access_token":@"2.00evHF2Cpsho5Da79c7354e9rt9rRB"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.statuses = [MTLJSONAdapter modelsOfClass:Status.class fromJSONArray:responseObject[@"statuses"] error:nil];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
   
    
}

@end

#pragma mark TableView 类目

@implementation ModelViewController (UITableView)
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
    StatusCell * cell = [tableView dequeueReusableCellWithIdentifier:self.idStr forIndexPath:indexPath];
    Status *s = self.statuses[indexPath.row];
    [cell setStatus:s];
    
    return cell;
}

@end


