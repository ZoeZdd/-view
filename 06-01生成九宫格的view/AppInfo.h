//
//  AppInfo.h
//  06-03生成九宫格的view
//
//  Created by 庄丹丹 on 16/4/9.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)appInfoWithDic:(NSDictionary *)dic;


+ (NSArray *)appInfosList;
@end
