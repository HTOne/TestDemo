//
//  AppDelegate+APPService.m
//  TestDemo
//
//  Created by 万海堂 on 2017/9/28.
//  Copyright © 2017年 万海堂. All rights reserved.
//

#import "AppDelegate+APPService.h"

@implementation AppDelegate (APPService)

#pragma mark ————— 初始化服务 —————
-(void)initService{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNotificationLoginStateChange
                                               object:nil];
    
    //网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(netWorkStateChange:)
                                                 name:KNotificationNetWorkStateChange
                                               object:nil];
}

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[RootTabBarController alloc] init];
    self.window.backgroundColor = KWhiteColor;
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    //    [[UIButton appearance] setShowsTouchWhenHighlighted:YES];
//    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = KWhiteColor;
}
+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
#pragma mark ————— 友盟 初始化 —————
-(void)initUMeng{
    /* 打开调试日志 */
//    [[UMSocialManager defaultManager] openLog:YES];
//
//    /* 设置友盟appkey */
//    [[UMSocialManager defaultManager] setUmSocialAppkey:UMengKey];
//
//    [self configUSharePlatforms];
}
#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus
{
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
//    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType networkStatus) {
//
//        switch (networkStatus) {
//                // 未知网络
//            case PPNetworkStatusUnknown:
//                DLog(@"网络环境：未知网络");
//                // 无网络
//            case PPNetworkStatusNotReachable:
//                DLog(@"网络环境：无网络");
//                KPostNotification(KNotificationNetWorkStateChange, @NO);
//                break;
//                // 手机网络
//            case PPNetworkStatusReachableViaWWAN:
//                DLog(@"网络环境：手机自带网络");
//                // 无线网络
//            case PPNetworkStatusReachableViaWiFi:
//                DLog(@"网络环境：WiFi");
//                KPostNotification(KNotificationNetWorkStateChange, @YES);
//                break;
//        }
//
//    }];
    
}


-(UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

@end
