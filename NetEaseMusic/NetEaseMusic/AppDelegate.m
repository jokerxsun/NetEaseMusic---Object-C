//
//  AppDelegate.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/21.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "AppDelegate.h"
#import "SXRootControllerTool.h"
#import "SXLaunchImageAdView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 启动图延迟
    [NSThread sleepForTimeInterval:1.5];
    
    // 1. 友盟
    
    // 2. 推送
    
    // 3. 启动
    [self makeWindowsVisible];
    
    // 4. 启动广告
    // [self launchImageAdView];
    
    return YES;
}

#pragma mark ---- 友盟数据统计

#pragma mark ---- 消息推送

#pragma mark ---- 启动应用
- (void)makeWindowsVisible
{
    // windows
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [UIViewController new];
    
    // rootController
    [SXRootControllerTool chooseTheAppLicationRootController];
}

#pragma mark ---- 启动页广告
- (void)launchImageAdView
{
    // 加载启动页广告
    /* FullScreenAdType 全屏广告
     * LogoAdType 带logo的广告类似网易广告，值得注意的是启动图片必须带logo图
     * ImgUrl  图片url
     */
    SXLaunchImageAdView * adView = [[SXLaunchImageAdView alloc]initWithWindow:self.window type:FullScreenAdType imgUrl:@"http://upload.chinaz.com/2015/0715/1436945569647.jpg"];
    // 广告界面回调
    adView.clickBlock = ^(NSInteger tag){
        switch (tag) {
            case 1100:{
                SXLog(@"点击广告回调");
            }
                break;
            case 1101:
                SXLog(@"点击跳过回调");
                break;
            case 1102:
                SXLog(@"倒计时完成后的回调");
                break;
            default:
                break;
        }
    };
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
