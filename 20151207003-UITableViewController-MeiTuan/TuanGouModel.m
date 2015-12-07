//
//  TuanGouModel.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "TuanGouModel.h"

@implementation TuanGouModel

/**
 *  根据字典返回一个团购实体类对象（对象方法）
 */
- (instancetype)initTuanGouWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        // 使用KVC将字典转成对象
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  根据字典返回一个团购实体类对象（类方法）
 */
+ (instancetype)tuanGouWithDictionary:(NSDictionary *)dictionary {
    return [[TuanGouModel alloc] initTuanGouWithDictionary:dictionary];
}

/**
 *  返回一个团购对象数组
 */
+ (NSArray *)tuanGouArray {
    // 1.从plist文件中读出数据
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]];
    
    // 2.创建一个可变数组用来装对象
    NSMutableArray *tuanGouArray = [NSMutableArray array];
    
    // 3.循环plist读出来的数据将其转为对象
    [plistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tuanGouArray addObject:[self tuanGouWithDictionary:obj]];
    }];
    
    // 4.返回对象数组
    return tuanGouArray;
}

/**
 *  复写对象的description方法，打印对象内容
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@, %p> {buyCount:%@, icon:%@, price:%@, title:%@}", self.class, self, self.buyCount, self.icon, self.price, self.title];
}

@end
