//
//  TuanGouTableViewCell.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "TuanGouTableViewCell.h"

@interface TuanGouTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *tuanGouImageView;
@property (weak, nonatomic) IBOutlet UILabel *tuanGouNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tuanGouPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tuanGoubuyCountLabel;

@end

@implementation TuanGouTableViewCell

/**
 *  通过表格初始化一个团购表格行（对象方法）
 */
- (instancetype)initTuanGouTableViewCellWithTableView:(UITableView *)tableView {
    TuanGouTableViewCell *tuanGouTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"tuanGouTableViewIdentifier"];
    
    if (nil == tuanGouTableViewCell) {
        tuanGouTableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"TuanGouTableViewCell" owner:nil options:nil] lastObject];
    }
    
    return tuanGouTableViewCell;
}

/**
 *  通过表格初始化一个团购表格行（类方法）
 */
+ (instancetype)tuanGouTableViewCellWithTableView:(UITableView *)tableView {
    return [[TuanGouTableViewCell alloc] initTuanGouTableViewCellWithTableView:tableView];
}

/**
 *  复写团购属性的setter方法，并给表格行属性填充数据
 */
- (void)setTuanGou:(TuanGouModel *)tuanGou {
    _tuanGou = tuanGou;
    
    self.tuanGouImageView.image = [UIImage imageNamed:tuanGou.icon];
    self.tuanGouNameLabel.text = tuanGou.title;
    self.tuanGouPriceLabel.text = [NSString stringWithFormat:@"¥%@", tuanGou.price ];
    self.tuanGoubuyCountLabel.text = [NSString stringWithFormat:@"%@人购买", tuanGou.buyCount];
}

@end
