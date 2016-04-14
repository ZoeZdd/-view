//
//  ViewController.m
//  06-01生成九宫格的view
//
//  Created by 庄丹丹 on 16/4/9.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppInfoView.h"

@interface ViewController ()

// 存储从plist中获取的数据
@property (nonatomic,strong) NSArray *appInfos;

@end

@implementation ViewController

// 1.懒加载
- (NSArray *)appInfos
{
    if (_appInfos == nil) {
        
        //  调用 appInfosList 类方法
        _appInfos = [AppInfo appInfosList];
     }
    return _appInfos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"%@",NSHomeDirectory());
//    
//    // 2. 测试数据
//    NSLog(@"%@",self.appInfos);
    
    // 3.  动态生成9宫格的方块
    for (int i = 0; i<self.appInfos.count; i++) {
        // 动态生成view
//        UIView *subView = [[UIView alloc] init];
//        [self.view addSubview:subView];
        
        // 从xib中加载 subView
//        NSBundle *bundle = [NSBundle mainBundle];
//        AppInfoView *subView = [[bundle loadNibNamed:@"AppInfoView" owner:nil options:nil] lastObject];
        
        
        
        //  封装自定义的 view
        AppInfoView *subView = [AppInfoView appInfoView];
        
        
        [self.view addSubview:subView];
        
        
        
        // 计算frame
        CGFloat subViewW = 100;
        CGFloat subViewH = 100;
//        子view的横向间距 = (父view的宽度- 3 * 子view的宽度) / 4
        CGFloat marginX = (self.view.frame.size.width - 3 * subViewW) / 4;
        
//        子view的纵向间距 = 20
        CGFloat marginY = 20;
//        当前子view的行号 = 当前遍历到得索引值 / 总列数
        int row = i / 3;
       
//        当前子view的列号 = 当前遍历到得索引值 % 总列数
        int column = i % 3;
//        子view横坐标的公式 = 子view的横向间距 + 列号 * (子view的横向间距+ 子view的宽度)
        CGFloat subViewX = marginX + column * (marginX + subViewW);
//        子view纵坐标的公式 = 20 + 行号 * (子view的纵向间距+ 子view的高度)
        CGFloat subViewY = 30 + row * (marginY + subViewH);
        
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);

        
        
        // 取得当前便利得到的数据
      AppInfo *appInfo = self.appInfos[i];
        
        // 给subView的子控件赋值
        
//        // 第一种方式
//        UIImageView *iconView = subView.subviews[0];
//        iconView.image = [UIImage imageNamed:appInfo.icon];
//        
//        // 第二种方式
//        UILabel *nameView = (UILabel *)[subView viewWithTag:10];
//        nameView.text = appInfo.name;
        
//        subView.nameView.text = appInfo.name;
//        subView.iconView.image = [UIImage imageNamed:appInfo.icon];
        
        
         subView.appInfo = appInfo;
        
//         [subView setData];
        
    }
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
