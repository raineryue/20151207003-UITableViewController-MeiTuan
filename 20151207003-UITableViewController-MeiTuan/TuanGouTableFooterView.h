//
//  TuanGouTableFooterView.h
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TuanGouTableFooterView;

@protocol TuanGouTableFooterViewDelegate <NSObject>

@optional
- (void)tuanGouTableFooterView:(TuanGouTableFooterView *)tableFooterView;

@end

@interface TuanGouTableFooterView : UIView

@property (nonatomic, weak) id<TuanGouTableFooterViewDelegate> delegate;

+ (instancetype)tuanGouTableFooterViewWithFrame:(CGRect)frame;

- (void)endLoadMoreData;

@end
