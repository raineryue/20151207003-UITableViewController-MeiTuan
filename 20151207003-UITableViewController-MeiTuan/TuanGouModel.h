//
//  TuanGouModel.h
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuanGouModel : NSObject

@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;

- (instancetype)initTuanGouWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)tuanGouWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)tuanGouArray;

@end
