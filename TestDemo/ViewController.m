//
//  ViewController.m
//  TestDemo
//
//  Created by 万海堂 on 2017/9/22.
//  Copyright © 2017年 万海堂. All rights reserved.
//

#import "ViewController.h"
#import "RootWebViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    RootWebViewController *webVc = [[RootWebViewController alloc] initWithUrl:@"http://www.hao123.com"];
    [self.navigationController pushViewController:webVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
