//
//  SXTabBarControllerConfig.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/22.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "SXTabBarControllerConfig.h"
#import "DiscoveryController.h"
#import "MusicTableController.h"
#import "FriendController.h"
#import "AccountTableController.h"

@interface SXTabBarControllerConfig ()

@property (nonatomic, strong) SXTabBarController *tabBarController;

@end


@implementation SXTabBarControllerConfig


/**
 *  lazy load tabBarController
 *
 *  @return SXTabBarController
 */
- (SXTabBarController *)tabBarController {
    if (!_tabBarController) {
        SXTabBarController *tabBarController = [SXTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                 tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                ];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    
    return _tabBarController;
}

- (NSArray *)viewControllers {
    DiscoveryController *discovery = [[DiscoveryController alloc] init];
    UINavigationController *discoveryNav = [[UINavigationController alloc] initWithRootViewController:discovery];
    
    MusicTableController *music = [[MusicTableController alloc] init];
    UINavigationController *musicNav = [[UINavigationController alloc] initWithRootViewController:music];
    
    FriendController *friend = [[FriendController alloc] init];
    UINavigationController *friendNav = [[UINavigationController alloc] initWithRootViewController:friend];
    
    AccountTableController *account = [[AccountTableController alloc] init];
    UINavigationController *accountNav = [[UINavigationController alloc] initWithRootViewController:account];
    
    NSArray *viewControllers = @[
                                 discoveryNav,
                                 musicNav,
                                 friendNav,
                                 accountNav
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *discoveryTabBarItemsAttributes = @{
                                                     CYLTabBarItemTitle : @"发现音乐",
                                                     CYLTabBarItemImage : @"cm2_btm_icn_discovery",
                                                     CYLTabBarItemSelectedImage : @"cm2_btm_icn_discovery_prs",
                                                     };
    NSDictionary *musicTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"我的音乐",
                                                 CYLTabBarItemImage : @"cm2_btm_icn_music",
                                                 CYLTabBarItemSelectedImage : @"cm2_btm_icn_music_prs",
                                                 };
    NSDictionary *friendTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"朋友",
                                                  CYLTabBarItemImage : @"cm2_btm_icn_friend",
                                                  CYLTabBarItemSelectedImage : @"cm2_btm_icn_friend_prs",
                                                  };
    NSDictionary *accountTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"账号",
                                                   CYLTabBarItemImage : @"cm2_btm_icn_account",
                                                   CYLTabBarItemSelectedImage : @"cm2_btm_icn_account_prs",
                                                   };
    
    NSArray *tabBarItemsAttributes = @[
                                       discoveryTabBarItemsAttributes,
                                       musicTabBarItemsAttributes,
                                       friendTabBarItemsAttributes,
                                       accountTabBarItemsAttributes
                                       ];
    
    return tabBarItemsAttributes;
}

#pragma mark ---- 更多属性
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = SXHEXCOLOR(0xB92500);
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];


}
@end
