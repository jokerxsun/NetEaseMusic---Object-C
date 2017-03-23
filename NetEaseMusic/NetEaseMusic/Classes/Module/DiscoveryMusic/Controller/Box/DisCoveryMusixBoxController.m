//
//  DisCoveryMusixBoxController.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/22.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "DisCoveryMusixBoxController.h"
#import "DiscoveryCollectionController.h"

@interface DisCoveryMusixBoxController ()

@property (nonatomic, strong) NSArray *boxs;
@end

@implementation DisCoveryMusixBoxController

- (instancetype)init
{
    if (self = [super init]) {
        [self configStyle];
    }
    return self;
}

- (void)configStyle
{
    [self setMenuHeight:33];
    
    [self setScrollEnable:YES];
    
    [self setMenuBGColor:[UIColor whiteColor]];
    
    [self setMenuItemWidth:80];
    
    [self setMenuViewStyle:WMMenuViewStyleLine];
    
    [self setProgressColor:SXBASECOLOR];
    
    [self setTitleColorNormal:SXHEXCOLOR(0x272727)];
    
    [self setTitleColorSelected:SXBASECOLOR];
    
    [self setTitleSizeNormal:14];
    
    [self setTitleSizeSelected:14];
    
    NSArray *itemLineW = @[
                           @(SX_SCREEN_WIDTH/4),
                           @((SX_SCREEN_WIDTH/4)/2),
                           @((SX_SCREEN_WIDTH/4)),
                           @((SX_SCREEN_WIDTH/4/2)*(3/2))
                           ];
    [self setProgressViewWidths:itemLineW];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController*)pageController
{
    return self.boxs.count;
}
- (UIViewController*)pageController:(WMPageController*)pageController viewControllerAtIndex:(NSInteger)index
{
    WeakSelf;
    return weakSelf.boxs[index];
}
- (NSString*)pageController:(WMPageController*)pageController titleAtIndex:(NSInteger)index
{
    WeakSelf;
    UIViewController* vc = weakSelf.boxs[index];
    return vc.title;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 lazy load list discoveryList Controller

 @return  discoveryListController
 */
- (NSArray *)boxs {
    if (!_boxs) {
        DiscoveryCollectionController *personalizedRecommendation = [[DiscoveryCollectionController alloc] init];
        personalizedRecommendation.title = @"个性推荐";
        [self addChildViewController:personalizedRecommendation];
        
        DiscoveryCollectionController *musicList = [[DiscoveryCollectionController alloc] init];
        musicList.title = @"歌单";
        [self addChildViewController:musicList];
        
        DiscoveryCollectionController *dj = [[DiscoveryCollectionController alloc] init];
        dj.title = @"主播电台";
        [self addChildViewController:dj];
        
        DiscoveryCollectionController *musicRank = [[DiscoveryCollectionController alloc] init];
        musicRank.title = @"排行榜";
        [self addChildViewController:musicRank];
        
        _boxs = @[ personalizedRecommendation, musicList, dj, musicRank ];
    }
    
    return _boxs;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
