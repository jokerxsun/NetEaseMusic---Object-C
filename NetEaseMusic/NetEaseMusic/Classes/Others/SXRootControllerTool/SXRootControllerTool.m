//
//  SXRootControllerTool.m
//  chuangyezhinan
//
//  Created by sunxu on 2017/3/17.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "SXRootControllerTool.h"
#import "SXTabBarControllerConfig.h"

@implementation SXRootControllerTool

+ (void)chooseTheAppLicationRootController
{
    // 比较版本号，版本号不同，设置 SXGuideController 为 rootController
    
    UIApplication* application = [UIApplication sharedApplication];
    UIWindow* window = application.keyWindow;
    SXTabBarControllerConfig *tabBarControllerConhfig = [[SXTabBarControllerConfig alloc] init];
    window.rootViewController = tabBarControllerConhfig.tabBarController;
}
@end
