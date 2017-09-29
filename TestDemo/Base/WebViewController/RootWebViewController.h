//
//  RootWebViewController.h
//  TestDemo
//
//  Created by 万海堂 on 2017/9/28.
//  Copyright © 2017年 万海堂. All rights reserved.
//

#import "RootViewController.h"

@interface RootWebViewController : RootViewController

/**
 *  origin url
 */
@property (nonatomic)NSString* url;

/**
 *  tint color of progress view
 */
@property (nonatomic)UIColor* progressViewColor;

/**
 *  get instance with url
 *
 *  @param url url
 *
 *  @return instance
 */
-(instancetype)initWithUrl:(NSString *)url;


-(void)reloadWebView;

@end
