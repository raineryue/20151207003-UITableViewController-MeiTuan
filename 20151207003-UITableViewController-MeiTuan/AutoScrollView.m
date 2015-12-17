//
//  AutoScrollView.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/13.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "AutoScrollView.h"

@interface AutoScrollView () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) int currentPage;

@end

@implementation AutoScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTimer];
    }
    
    return self;
}

#pragma mark - 控件懒加载
/**
 *  滚动视图懒加载
 */
- (UIScrollView *)scrollView {
    if (nil == _scrollView) {
        // 1.创建一个滚动视图设置大小为当前根部视图大小
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        // 2.设置滚动视图的滚动条
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        
        // 3.设置滚动视图是否分页
        scrollView.pagingEnabled = YES;
        
        // 4.设置滚动视图的代理
        scrollView.delegate = self;
        
        // 5.填充内容视图
        [self.contentArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:obj]];
            
            CGFloat imageViewX = self.bounds.size.width * idx;
            CGFloat imageViewY = 0;
            
            imageView.frame = (CGRect){{imageViewX, imageViewY}, self.bounds.size};
            
            [scrollView addSubview:imageView];
        }];
        
        // 6.设置滚动视图为公共属性
        _scrollView = scrollView;
        
        // 7.将滚动视图添加到根部视图上
        [self addSubview:_scrollView];
    }
    
    return _scrollView;
}

/**
 *  分页控件懒加载
 */
- (UIPageControl *)pageControl {
    if (nil == _pageControl) {
        // 1.创建一个分页视图
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        
        // 2.计算分页视图的位置
        CGFloat pageControlX = self.scrollView.center.x;
        CGFloat pageControlY = CGRectGetMaxY(self.scrollView.frame) - 10;

        // 3.根据总页数获取分页控件的大小
        CGSize pageControlSize = [pageControl sizeForNumberOfPages:pageControl.numberOfPages];
        
        // 4.设置分页控件的位置和大小
        pageControl.center = CGPointMake(pageControlX, pageControlY);
        pageControl.bounds = (CGRect){CGPointZero, pageControlSize};
        
        // 5.设置分页控件页码的颜色
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        
        // 6.设置默认分页
        pageControl.currentPage = 0;
        
        // 7.监听值改变事件
        [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
        
        // 8.将分页控件公开
        _pageControl = pageControl;
        
        // 9.将分页控件添加到当前视图上
        [self addSubview:_pageControl];
    }
    
    return _pageControl;
}

#pragma mark - 属性方法复写
/**
 *  复写数据源的setter方法
 */
- (void)setContentArray:(NSArray *)contentArray {
    _contentArray = contentArray;
    
    // 1.设置内容大小
    CGFloat contentSizeW = self.bounds.size.width * contentArray.count;
    CGFloat contentSizeH = self.bounds.size.height;
    
    self.scrollView.contentSize = CGSizeMake(contentSizeW, contentSizeH);
    
    // 2.设置分页控件的总页数
    self.pageControl.numberOfPages = contentArray.count;
}

#pragma mark - 控件事件监听方法
/**
 *  定时器监听事件
 */
- (void)timerDidAction:(NSTimer *)timer {
    [self pageControlValueChangeAction:self.pageControl];
}

/**
 *  分页控件值改变事件监听
 */
- (void)pageControlValueChangeAction:(UIPageControl *)pageControl {
    NSInteger currentPage = self.pageControl.currentPage;
    
    if (currentPage == self.contentArray.count - 1) {
        currentPage = 0;
    } else {
        currentPage ++;
    }
    
    CGFloat scrollViewW = self.scrollView.bounds.size.width;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.scrollView.contentOffset = CGPointMake(scrollViewW * currentPage, 0);
    }];
}

#pragma mark - 滚动视图代理方法
/**
 *  开始拽动滚动视图
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self endTimer];
}

/**
 *  滚动视图完成滚动（正在滚动）
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollViewContentOffsetX = scrollView.contentOffset.x;
    
    CGFloat scrollViewW = scrollView.bounds.size.width;
    
    int currentPage = (scrollViewContentOffsetX + scrollViewW * 0.5) / scrollViewW;

    [UIView animateWithDuration:0.3f animations:^{
        self.pageControl.currentPage = currentPage;
    }];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

#pragma mark - 私有辅助方法
/**
 *  添加定时器
 */
- (void)addTimer {
    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(timerDidAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  开始定时器
 */
- (void)startTimer {
    [self pageControlValueChangeAction:self.pageControl];
}

/**
 *  停止定时器
 */
- (void)endTimer {
    [self.timer invalidate];
}

@end
