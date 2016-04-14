//
//  AppInfoView.h
//  06-06生成九宫格的view
//
//  Created by 庄丹丹 on 16/4/9.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppInfo;

@interface AppInfoView : UIView

@property (nonatomic,strong) AppInfo *appInfo;

+ (instancetype)appInfoView;

//- (void)setData;
@end
