//
//  BasePageController.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/22.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "BasePageController.h"

@interface BasePageController ()

@end

@implementation BasePageController

- (instancetype)init
{
    if (self = [super init]) {
        [self configStyle];
    }
    return self;
}

- (void)configStyle
{
    [self setMenuHeight:40];
    
    [self setProgressViewIsNaughty:YES];
    
    [self setMenuBGColor:[UIColor whiteColor]];
    
    //[self setMenuItemWidth:RYB_SCREEN_WIDTH / 3];
    
    //[self setMenuViewBottom:1];
    
    [self setMenuViewBottomSpace:0];
    
    [self setMenuViewStyle:WMMenuViewStyleLine];
    
//    [self setProgressColor:RYBBASECOLOR];
//    
//    [self setTitleColorNormal:RYBHEXCOLOR(0x272727)];
//    
//    [self setTitleColorSelected:RYBBASECOLOR];
    
    [self setTitleSizeNormal:15];
    
    [self setTitleSizeSelected:15];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)dealloc
{
}

@end
