//
//  AutoScrollView.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/13.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "AutoScrollView.h"

@interface AutoScrollView ()

@property (nonatomic, assign) NSInteger imageCount;

@end

@implementation AutoScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        self.pagingEnabled = NO;
    }
    
    return self;
}

- (void)setContentArray:(NSArray *)contentArray {
    _contentArray = contentArray;
    
    // 1.设置总数据
    self.imageCount = _contentArray.count;
    
    // 2.设置内容大小
    CGFloat contentSizeW = self.bounds.size.width * self.imageCount;
    CGFloat contentSizeH = self.bounds.size.height;
    
    self.contentSize = CGSizeMake(contentSizeW, contentSizeH);

    // 3.填充内容视图
    [contentArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:obj]];
        
        CGFloat imageViewX = self.bounds.size.width * idx;
        CGFloat imageViewY = 0;
        
        imageView.frame = (CGRect){{imageViewX, imageViewY}, self.bounds.size};
        
        [self addSubview:imageView];
    }];
}

@end
