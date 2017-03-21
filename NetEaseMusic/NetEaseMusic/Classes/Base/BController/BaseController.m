//
//  BaseController.m
//  MVVM Without Binding With DataController
//
//  Created by sunxu on 2017/3/16.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
}

#pragma mark ---- setup contentView 
- (void)setupContentView
{
    self.view.backgroundColor = [UIColor whiteColor];
    SXLog(@"%@____%@____", self, [self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
