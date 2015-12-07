//
//  ViewController.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "TuanGouModel.h"
#import "TuanGouTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *tuanGouArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.contentInset = UIEdgeInsetsMake(160, 0, 0, 0);
    self.tableView.rowHeight = 80;
    
    NSLog(@"%@", self.tuanGouArray);
}

#pragma mark - 数据源代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuanGouArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TuanGouTableViewCell *tuanGouTableViewCell = [TuanGouTableViewCell tuanGouTableViewCellWithTableView:tableView tuanGouModel:self.tuanGouArray[indexPath.row]];
    
    return tuanGouTableViewCell;
}

- (NSArray *)tuanGouArray {
    if (nil == _tuanGouArray) {
        _tuanGouArray = [TuanGouModel tuanGouArray];
    }
    
    return _tuanGouArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
