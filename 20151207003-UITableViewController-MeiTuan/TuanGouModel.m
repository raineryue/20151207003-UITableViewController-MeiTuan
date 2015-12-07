//
//  TuanGouModel.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "TuanGouModel.h"

@implementation TuanGouModel

- (instancetype)initTuanGouWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

+ (instancetype)tuanGouWithDictionary:(NSDictionary *)dictionary {
    return [[TuanGouModel alloc] initTuanGouWithDictionary:dictionary];
}

+ (NSArray *)tuanGouArray {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]];
    
    NSMutableArray *tuanGouArray = [NSMutableArray array];
    
    [plistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tuanGouArray addObject:[self tuanGouWithDictionary:obj]];
    }];
    
    return tuanGouArray;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@, %p> {buyCount:%@, icon:%@, price:%@, title:%@}", self.class, self, self.buyCount, self.icon, self.price, self.title];
}

@end
