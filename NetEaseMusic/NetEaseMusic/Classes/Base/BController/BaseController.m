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
    
    [self setupNavgationBar];
    
    [self setupContentView];
}

#pragma mark ---- setup navgationBar
- (void)setupNavgationBar
{
    WeakSelf;
    UINavigationBar* navBar = weakSelf.navigationController.navigationBar;
    
//    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_light"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    
    [navBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : SXHEXCOLOR(0x272727), NSFontAttributeName : [UIFont systemFontOfSize:17 weight:UIFontWeightLight] }];
    
    [navBar setShadowImage:[[UIImage alloc] init]];
    
    navBar.tintColor = SXHEXCOLOR(0x272727);
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
