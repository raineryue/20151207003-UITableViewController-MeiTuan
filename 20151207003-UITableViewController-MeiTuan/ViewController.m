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
#import "TuanGouTableHeaderView.h"
#import "TuanGouTableFooterView.h"

@interface ViewController () <TuanGouTableFooterViewDelegate>

/** 头部视图 */
@property (nonatomic, strong) TuanGouTableHeaderView *tableHeaderView;

/** 尾部视图 */
@property (nonatomic, strong) TuanGouTableFooterView *tableFooterView;

/** 团购对象数组 */
@property (nonatomic, strong) NSMutableArray *tuanGouArray;

@end

@implementation ViewController

#pragma mark - 控制器加载
/**
 *  视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.设置表格的内边距
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    // 2.设置表格的统一高度
    self.tableView.rowHeight = 80;
    
    // 3.设置表头部视图
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    // 4.设置表尾部视图
    self.tableView.tableFooterView = self.tableFooterView;
}

#pragma mark - 数据源代理方法
/**
 *  返回当前组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuanGouArray.count;
}

/**
 *  返回当前索引的表格行
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.根据tableView创建一个团购表格行
    TuanGouTableViewCell *tuanGouTableViewCell = [TuanGouTableViewCell tuanGouTableViewCellWithTableView:tableView];
    
    // 2.给表格行填充团购信息数据
    tuanGouTableViewCell.tuanGou = self.tuanGouArray[indexPath.row];
    
    // 3.返回表格行
    return tuanGouTableViewCell;
}

#pragma mark - 控件懒加载
/**
 *  头部视图
 */
- (UIView *)tableHeaderView {
    if (nil == _tableHeaderView) {
        // 1.创建头部视图
        _tableHeaderView = [[TuanGouTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 161)];
    }
    
    return _tableHeaderView;
}

/**
 *  尾部视图
 */
- (UIView *)tableFooterView {
    if (nil == _tableFooterView) {
        _tableFooterView = [[TuanGouTableFooterView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
        _tableFooterView.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:246 / 255.0 blue:246 / 255.0 alpha:1.0];
        _tableFooterView.delegate = self;
    }
    
    return _tableFooterView;
}

#pragma mark - 属性懒加载
/**
 *  团购属性懒加载，加载团购数组
 */
- (NSMutableArray *)tuanGouArray {
    if (nil == _tuanGouArray) {
        _tuanGouArray = [NSMutableArray arrayWithArray:[TuanGouModel tuanGouArray]];
    }
    
    return _tuanGouArray;
}

- (void)tuanGouTableFooterView:(TuanGouTableFooterView *)tableFooterView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        TuanGouModel *tuanGouModel = [[TuanGouModel alloc] init];
        
        tuanGouModel.buyCount = @"20";
        tuanGouModel.icon = @"37e4761e6ecf56a2d78685df7157f097.png";
        tuanGouModel.price = @"188";
        tuanGouModel.title = @"诸葛烤鱼";
        
        [self.tuanGouArray addObject:tuanGouModel];
    
//        [self.tableView reloadData];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tuanGouArray.count - 1 inSection:0];
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
        [tableFooterView endLoadMoreData];
    });
}


#pragma mark - 内存处理方法
/**
 *  内存溢出处理
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
