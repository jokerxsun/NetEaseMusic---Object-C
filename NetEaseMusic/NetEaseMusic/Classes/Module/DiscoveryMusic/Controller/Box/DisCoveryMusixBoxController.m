//
//  DisCoveryMusixBoxController.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/22.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "DisCoveryMusixBoxController.h"

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

#pragma mark ---- config the Controller style
- (void)configStyle
{
    [self setMenuHeight:33];
    
    [self setScrollEnable:NO];
    
    [self setMenuBGColor:[UIColor whiteColor]];
    
    [self setMenuItemWidth:80];
    
    [self setMenuViewStyle:WMMenuViewStyleDefault];
    
//    [self setProgressColor:RYBBASECOLOR];
//    
//    [self setTitleColorNormal:RYBHEXCOLOR(0x272727)];
//    
//    [self setTitleColorSelected:RYBBASECOLOR];
    
    [self setTitleSizeNormal:14];
    
    [self setTitleSizeSelected:14];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
