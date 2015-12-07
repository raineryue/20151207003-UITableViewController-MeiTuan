//
//  TuanGouModel.h
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuanGouModel : NSObject

/** 购买人数 */
@property (nonatomic, copy) NSString *buyCount;
/** 图片名称 */
@property (nonatomic, copy) NSString *icon;
/** 价格 */
@property (nonatomic, copy) NSString *price;
/** 团购标题 */
@property (nonatomic, copy) NSString *title;

/**
 *  根据字典返回一个团购实体类对象（对象方法）
 */
- (instancetype)initTuanGouWithDictionary:(NSDictionary *)dictionary;

/**
 *  根据字典返回一个团购实体类对象（类方法）
 */
+ (instancetype)tuanGouWithDictionary:(NSDictionary *)dictionary;

/**
 *  返回一个团购对象数组
 */
+ (NSArray *)tuanGouArray;

@end
