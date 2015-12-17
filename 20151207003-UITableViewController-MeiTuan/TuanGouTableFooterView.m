//
//  TuanGouTableFooterView.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "TuanGouTableFooterView.h"

@interface TuanGouTableFooterView ()

@property (nonatomic, weak) UIActivityIndicatorView *activity;
@property (nonatomic, weak) UIButton *loadMoreButton;

@end

@implementation TuanGouTableFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self.loadMoreButton addTarget:self action:@selector(loadMoreButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

+ (instancetype)tuanGouTableFooterViewWithFrame:(CGRect)frame {
    return [[TuanGouTableFooterView alloc] initWithFrame:frame];
}

- (void)loadMoreButtonClickAction:(UIButton *)button {
    button.hidden = YES;
    
    self.activity.hidden = NO;
    [self.activity startAnimating];
    
    if ([self.delegate respondsToSelector:@selector(tuanGouTableFooterView:)]) {
        [self.delegate tuanGouTableFooterView:self];
    }
}

- (UIButton *)loadMoreButton {
    if (nil == _loadMoreButton) {
        UIButton *loadMoreButton = [[UIButton alloc] init];
        loadMoreButton.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        loadMoreButton.backgroundColor = [UIColor clearColor];
        [loadMoreButton setTitle:@"更多" forState:UIControlStateNormal];
        [loadMoreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        loadMoreButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        _loadMoreButton = loadMoreButton;
        
        [self addSubview:_loadMoreButton];
    }
    
    return _loadMoreButton;
}

- (UIActivityIndicatorView *)activity {
    if (nil == _activity) {
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
 
        activity.frame = CGRectMake((self.bounds.size.width - 40) * 0.5, 0, 40, 40);
        activity.hidden = YES;
        
        _activity = activity;
        [self addSubview:_activity];
    }
    
    return _activity;
}

- (void)endLoadMoreData {
    self.loadMoreButton.hidden = NO;
    
    [self.activity stopAnimating];
    
    self.activity.hidden = YES;
}

@end
