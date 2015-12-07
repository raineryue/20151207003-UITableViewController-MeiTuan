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

#define kViewMargin 10
#define kAdImageCount 5

@interface ViewController ()

/** 头部视图 */
@property (nonatomic, strong) UIView *tableHeaderView;

/** 尾部视图 */
@property (nonatomic, strong) UIView *tableFooterView;

/** 团购对象数组 */
@property (nonatomic, strong) NSArray *tuanGouArray;

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
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 141)];
        
        // 2.创建滚动视图
        UIScrollView *imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kViewMargin, 0, _tableHeaderView.bounds.size.width - kViewMargin * 2, 90)];
        imageScrollView.contentSize = CGSizeMake(imageScrollView.bounds.size.width * kAdImageCount, imageScrollView.bounds.size.height);
        imageScrollView.pagingEnabled = YES;
        imageScrollView.backgroundColor = [UIColor orangeColor];
        
        [_tableHeaderView addSubview:imageScrollView];
        
        // 3.创建分割线视图
        UIView *lineViewTop = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageScrollView.frame) + kViewMargin, _tableHeaderView.bounds.size.width, 0.5)];
        lineViewTop.backgroundColor = [UIColor lightGrayColor];
        [_tableHeaderView addSubview:lineViewTop];
        
        // 4.创建标题标签
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kViewMargin, CGRectGetMaxY(lineViewTop.frame), _tableHeaderView.bounds.size.width, 40)];
        titleLabel.text = @"猜你喜欢";
        [_tableHeaderView addSubview:titleLabel];
        
        // 3.创建分割线视图
        UIView *lineViewButtom = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), _tableHeaderView.bounds.size.width, 0.5)];
        lineViewButtom.backgroundColor = [UIColor lightGrayColor];
        [_tableHeaderView addSubview:lineViewButtom];
    }
    
    return _tableHeaderView;
}

/**
 *  尾部视图
 */
- (UIView *)tableFooterView {
    if (nil == _tableFooterView) {
        _tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
        _tableFooterView.backgroundColor = [UIColor yellowColor];
    }
    
    return _tableFooterView;
}

#pragma mark - 属性懒加载
/**
 *  团购属性懒加载，加载团购数组
 */
- (NSArray *)tuanGouArray {
    if (nil == _tuanGouArray) {
        _tuanGouArray = [TuanGouModel tuanGouArray];
    }
    
    return _tuanGouArray;
}

#pragma mark - 内存处理方法
/**
 *  内存溢出处理
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
