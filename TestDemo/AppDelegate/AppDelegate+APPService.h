//
//  AppDelegate+APPService.h
//  TestDemo
//
//  Created by 万海堂 on 2017/9/28.
//  Copyright © 2017年 万海堂. All rights reserved.
//

#import "AppDelegate.h"

/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */

@interface AppDelegate (APPService)

//初始化服务
-(void)initService;

//初始化 window
-(void)initWindow;

//初始化 UMeng
-(void)initUMeng;

//初始化用户系统
-(void)initUserManager;

//监听网络状态
- (void)monitorNetworkStatus;


//单例
+ (AppDelegate *)shareAppDelegate;

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;


@end
