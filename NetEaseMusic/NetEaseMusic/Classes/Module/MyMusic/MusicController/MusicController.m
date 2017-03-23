//
//  MusicController.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/23.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "MusicController.h"
#import "MusicContentController.h"

@interface MusicController ()

@end

@implementation MusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的音乐";
    
    [self setupContentView];
}

- (void)setupContentView
{
    MusicContentController *contentController = [MusicContentController loadVCFromStoryboard:StoryboardTypeDefault];
    [self addChildViewController:contentController];
    UITableView *tb = contentController.tableView;
    tb.frame = self.view.bounds;
    float h = 64;
    tb.frame = CGRectMake(0, h, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT - h-49);
    [self.view addSubview:tb];
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
