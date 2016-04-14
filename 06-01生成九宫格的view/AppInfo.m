//
//  AppInfo.m
//  06-03生成九宫格的view
//
//  Created by 庄丹丹 on 16/4/9.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}

+ (instancetype)appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}


+(NSArray *)appInfosList
{
    // 1.1 bundle
    NSBundle *bundle = [NSBundle mainBundle];
    
    // 1.2 获取plist的路径
    NSString *path = [bundle pathForResource:@"app" ofType:@"plist"];
    
    // 1.3 加载plist
    //        _appInfos = [NSArray arrayWithContentsOfFile:path];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    // 1.4 字典转模型
    for (NSDictionary *dic in dicArray) {
        
        // 调用 appInfoWithDic 类方法
        AppInfo *appInfo = [AppInfo appInfoWithDic:dic];
        
        [tempArray addObject:appInfo];
    }
    return  tempArray;

}
@end
