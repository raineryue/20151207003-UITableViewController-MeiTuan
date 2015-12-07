//
//  NSArray+Log.m
//  20151207003-UITableViewController-MeiTuan
//
//  Created by Rainer on 15/12/7.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *descriptionString = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [descriptionString appendFormat:@"\t%@,\n", obj];
    }];
    
    [descriptionString appendString:@")\n"];
    
    return descriptionString;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *descriptionString = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [descriptionString appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [descriptionString appendString:@")\n"];
    
    return descriptionString;
}

@end
