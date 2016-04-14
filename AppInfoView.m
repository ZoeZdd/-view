//
//  AppInfoView.m
//  06-06生成九宫格的view
//
//  Created by 庄丹丹 on 16/4/9.
//  Copyright © 2016年 庄丹丹. All rights reserved.
//

#import "AppInfoView.h"
#import "AppInfo.h"

@interface AppInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;

@end

@implementation AppInfoView

+ (instancetype)appInfoView
{
    
    // 从xib中加载 subView
    NSBundle *bundle = [NSBundle mainBundle];
    
    AppInfoView *subView = [[bundle loadNibNamed:@"AppInfoView" owner:nil options:nil] lastObject];
    
    return subView;
}


// 重写属性的setter方法    给子控件赋值
-(void)setAppInfo:(AppInfo *)appInfo
{
    _appInfo = appInfo;  // 必须写
    
    self.nameView.text = appInfo.name;
    self.iconView.image = [UIImage imageNamed:appInfo.icon];
    
}

// 若不在setter方法中重写也可   但最好在setter中写
//- (void)setData
//{
//    self.nameView.text = self.appInfo.name;
//    self.iconView.image = [UIImage imageNamed:self.appInfo.icon];
//}


- (IBAction)downloadClick:(UIButton *)sender {
    
    // 取消与用户的交互
    self.superview.userInteractionEnabled = NO;
    
    sender.enabled = NO;
    
    //  提示正在下载
    UILabel *tipView = [[UILabel alloc]init];
    
    //self(自定义的view).superview(控制器的根view)
    [self.superview addSubview:tipView];
    
    tipView.text = [NSString stringWithFormat:@"正在下载：%@",self.appInfo.name];
    
    // 设置frame
    CGFloat tipW = 200;
    CGFloat tipH = 25;
    CGFloat tipX = (self.superview.frame.size.width - tipW) / 2;
    CGFloat tipY = (self.superview.frame.size.height - tipH) / 2;
    tipView.frame = CGRectMake(tipX, tipY, tipW, tipH);
    
    tipView.backgroundColor = [UIColor grayColor];
    
    // 居中
    tipView.textAlignment = NSTextAlignmentCenter;
    
    // 透明度
    tipView.alpha = 0;
    
    // 圆角
    tipView.layer.cornerRadius = 5;
    // 默认值是no  会剪裁超过形状的部分
    tipView.layer.masksToBounds = YES;
    
    
    // 动画效果
    [UIView animateWithDuration:1.0 animations:^{
        tipView.alpha = 0.9;
    }completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:1.0 delay:3.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            tipView.alpha = 0;
            
        } completion:^(BOOL finished) {
            // 从父view中移除
            [tipView removeFromSuperview];
            
            self.superview.userInteractionEnabled = YES;
            
        }];

    }];
     
}






@end





















