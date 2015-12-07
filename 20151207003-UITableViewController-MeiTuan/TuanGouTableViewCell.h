//
//  TuanGouTableViewCell.h
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuanGouModel.h"

@interface TuanGouTableViewCell : UITableViewCell

/** 团购实体类对象属性 */
@property (nonatomic, strong) TuanGouModel *tuanGou;

/**
 *  通过表格初始化一个团购表格行（对象方法）
 */
- (instancetype)initTuanGouTableViewCellWithTableView:(UITableView *)tableView;

/**
 *  通过表格初始化一个团购表格行（类方法）
 */
+ (instancetype)tuanGouTableViewCellWithTableView:(UITableView *)tableView;

@end
