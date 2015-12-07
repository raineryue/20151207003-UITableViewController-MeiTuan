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

- (instancetype)initTuanGouTableViewCellWithTableView:(UITableView *)tableView tuanGouModel:(TuanGouModel *)tuanGou;

+ (instancetype)tuanGouTableViewCellWithTableView:(UITableView *)tableView tuanGouModel:(TuanGouModel *)tuanGou;

@end
