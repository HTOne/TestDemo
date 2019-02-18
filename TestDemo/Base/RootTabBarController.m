//
//  RootTabBarController.m
//  TestDemo
//
//  Created by 万海堂 on 2017/9/28.
//  Copyright © 2017年 万海堂. All rights reserved.
//

#import "RootTabBarController.h"
#import "UtilsMacros.h"
#import "RootViewController.h"
#import "RootNavigationController.h"
#import "UIButton+CZAddition.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildControllers];
    [self setupComposeButton];
    
}

- (void) setupChildControllers {
    NSMutableArray *arrM = [NSMutableArray array];
    NSArray *arr = @[
                     @{@"clsName" : @"HomeViewController", @"title" : @"首页", @"imageName" : @"tabbar_home"},
                     @{@"clsName" : @"MessageViewController", @"title" : @"消息", @"imageName" : @"tabbar_message_center"},
                     @{@"clsName" : @"UIViewController"},
                     @{@"clsName" : @"DiscoverViewController", @"title" : @"发现", @"imageName" : @"tabbar_discover"},
                     @{@"clsName" : @"MineViewController", @"title" : @"我", @"imageName" : @"tabbar_profile"},
                     ];
    for (NSDictionary *dic in arr) {
        [arrM addObject:[self controller:dic]];
    }
    self.viewControllers = arrM;
}

- (void) setupComposeButton {
    UIButton *composeBtn = [UIButton cz_imageButton:@"tabbar_compose_icon_add" backgroundImageName:@"tabbar_compose_button"];
    CGFloat w = self.tabBar.bounds.size.width / self.viewControllers.count - 1;
    composeBtn.frame = CGRectInset(self.tabBar.bounds, 2 * w, 0);
    [self.tabBar addSubview:composeBtn];
    [composeBtn addTarget:self action:@selector(composeStatus) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void) composeStatus {
    NSLog(@"%s", __func__);
}
/**
 使用字典创建一个子控制器
 
 @param dic 信息字典[clsName, title, imageName]
 @return 子控制器
 */
- (UIViewController *) controller:(NSDictionary *)dic {
    UIViewController *vc = [[NSClassFromString(dic[@"clsName"]) alloc] init];
    if ([vc isKindOfClass:[RootViewController class]]) {
        vc.title = dic[@"title"];
        vc.tabBarItem.image = [UIImage imageNamed:dic[@"imageName"]];
        vc.tabBarItem.selectedImage =  [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", dic[@"imageName"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateHighlighted];
        [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    }
    RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:vc];
    return nav;
}
#pragma mark - 控制屏幕支持的方向
/**
 portrait    : 竖屏，肖像
 landscape   : 横屏，风景画
 
 - 使用代码控制设备的方向，好处，可以在在需要横屏的时候，单独处理！
 - 设置支持的方向之后，当前的控制器及子控制器都会遵守这个方向！
 - 如果播放视频，通常是通过 modal 展现的！
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}



@end
