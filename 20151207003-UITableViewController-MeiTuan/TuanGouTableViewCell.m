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

- (instancetype)initTuanGouTableViewCellWithTableView:(UITableView *)tableView tuanGouModel:(TuanGouModel *)tuanGou {
    TuanGouTableViewCell *tuanGouTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"tuanGouTableViewIdentifier"];
    
    if (nil == tuanGouTableViewCell) {
        tuanGouTableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"TuanGouTableViewCell" owner:nil options:nil] lastObject];
    }
    
    self.tuanGouImageView.image = [UIImage imageNamed:tuanGou.icon];
    self.tuanGouNameLabel.text = tuanGou.title;
    self.tuanGouPriceLabel.text = [NSString stringWithFormat:@"¥%@", tuanGou.price ];
    self.tuanGoubuyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", tuanGou.buyCount];
    
    return tuanGouTableViewCell;
}

+ (instancetype)tuanGouTableViewCellWithTableView:(UITableView *)tableView tuanGouModel:(TuanGouModel *)tuanGou {
        return [[TuanGouTableViewCell alloc] initTuanGouTableViewCellWithTableView:tableView tuanGouModel:tuanGou];
}


@end
