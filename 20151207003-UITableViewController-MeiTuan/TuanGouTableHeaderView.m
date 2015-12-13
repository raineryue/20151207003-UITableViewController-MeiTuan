//
//  TuanGouTableHeaderView.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/13.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "TuanGouTableHeaderView.h"
#import "AutoScrollView.h"

#define kViewMargin 10
#define kAdImageCount 5

@interface TuanGouTableHeaderView ()

@property (nonatomic, strong) AutoScrollView *imageScrollView;
@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, strong) NSArray *scrollViewDataArray;

@end

@implementation TuanGouTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1.创建滚动视图
        self.imageScrollView = [[AutoScrollView alloc] initWithFrame:CGRectMake(kViewMargin, 0, self.bounds.size.width - kViewMargin * 2, 115)];
        self.imageScrollView.contentArray = self.scrollViewDataArray;
        
        [self addSubview:self.imageScrollView];
        
        // 2.设置默认分页
        self.pageControl.currentPage = 0;
        
        // 3.创建分割线视图
        UIView *lineViewTop = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageScrollView.frame) + kViewMargin, self.bounds.size.width, 0.5)];
        lineViewTop.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineViewTop];
        
        // 4.创建标题标签
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kViewMargin, CGRectGetMaxY(lineViewTop.frame), self.bounds.size.width, 35)];
        titleLabel.text = @"猜你喜欢";
        [self addSubview:titleLabel];
        
        // 5.创建分割线视图
        UIView *lineViewButtom = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), self.bounds.size.width, 0.5)];
        lineViewButtom.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineViewButtom];

    }
    
    return self;
}

- (NSArray *)scrollViewDataArray {
    if (nil == _scrollViewDataArray) {
        NSMutableArray *adImageDataArray = [NSMutableArray array];
        
        for (int i = 0; i < kAdImageCount; i++) {
            NSString *adImageName = [NSString stringWithFormat:@"ad_%02d", i];
        
            [adImageDataArray addObject:adImageName];
        }
        
        _scrollViewDataArray = adImageDataArray;
    }
    
    return _scrollViewDataArray;
}

- (UIPageControl *)pageControl {
    if (nil == _pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        
        pageControl.numberOfPages = self.scrollViewDataArray.count;
        
        CGSize pageControlSize = [pageControl sizeForNumberOfPages:pageControl.numberOfPages];
        
        CGFloat pageControlX = self.imageScrollView.center.x;
        CGFloat pageControlY = CGRectGetMaxY(self.imageScrollView.frame) - 10;
        
        pageControl.center = CGPointMake(pageControlX, pageControlY);
        pageControl.bounds = (CGRect){CGPointZero, pageControlSize};
        
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        
        _pageControl = pageControl;
        
        [self addSubview:_pageControl];
    }
    
    return _pageControl;
}

@end
