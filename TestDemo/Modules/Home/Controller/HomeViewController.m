//
//  HomeViewController.m
//  TestDemo
//
//  Created by 万海堂 on 2017/9/28.
//  Copyright © 2017年 万海堂. All rights reserved.
//

#import "HomeViewController.h"
#import "RootWebViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationItemWithTitles:@[@"pre网页",@"push网页"] isLeft:NO target:self action:@selector(naviBtnClick:) tags:@[@1002,@1003]];
}

-(void)naviBtnClick:(UIButton *)btn{
    RootWebViewController *webView = [[RootWebViewController alloc] initWithUrl:@"http://hao123.com"];
    [webView addNavigationItemWithTitles:@[@"测试"] isLeft:NO target:self action:@selector(naviBtnClick:) tags:@[@1003]];
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
