//
//  UIViewController+SX.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/22.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "UIViewController+SX.h"

@implementation UIViewController (SX)

- (void)showErrorView:(ErrorType)type
{
    WeakSelf;
    [weakSelf hideErrorView];
    UIButton* errorView = [UIButton buttonWithType:UIButtonTypeCustom];
    switch (type) {
        case ErrorTypeNetwork: {
            [errorView setImage:[UIImage imageNamed:@"img_nointerent"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptyDownload: {
            [errorView setImage:[UIImage imageNamed:@"img_nodownload"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptyBox: {
            [errorView setImage:[UIImage imageNamed:@"img_nobook"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptyMessage: {
            [errorView setImage:[UIImage imageNamed:@"img_nonews"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptySubscribe: {
            [errorView setImage:[UIImage imageNamed:@"img_noreading"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptySearch: {
            [errorView setImage:[UIImage imageNamed:@"img_nosearch"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptyBook: {
            [errorView setImage:[UIImage imageNamed:@"img_noreading"] forState:UIControlStateNormal];
            break;
        }
        case ErrorTypeEmptyShopCar: {
            [errorView setImage:[UIImage imageNamed:@"shoppingcart_img_nothing"] forState:UIControlStateNormal];
            break;
        }
        default:
            [errorView setImage:[UIImage imageNamed:@"img_nowritebook"] forState:UIControlStateNormal];
            break;
    }
    errorView.frame = CGRectMake(0, 0.5 * (SX_SCREEN_HEIGHT - SX_SCREEN_WIDTH) * 0.5, SX_SCREEN_WIDTH, SX_SCREEN_WIDTH);
    errorView.tag = 521;
    [errorView addTarget:weakSelf action:@selector(emptyDataClick) forControlEvents:UIControlEventTouchUpInside];
    [weakSelf.view addSubview:errorView];
    [weakSelf.view bringSubviewToFront:errorView];
    SXLogFunc();
}

- (void)hideErrorView
{
    WeakSelf;
    SXLogFunc();
    for (UIView* view in weakSelf.view.subviews) {
        if (view.tag == 521) {
            [view removeFromSuperview];
            break;
        }
    }
}

- (void)emptyDataClick
{
    [self hideErrorView];
//    [[NSNotificationCenter defaultCenter] postNotificationName:APP_NOTIFICATION_FROM_ERROR_NETWORK_REQUEST_DATA object:nil];
}
+ (instancetype)loadVCFromStoryboard:(StoryboardType)type
{
    NSString* sb_name;
    switch (type) {
        case StoryboardTypeMall:
            sb_name = @"MallStoryboard";
            break;
        default:
            sb_name = @"AppLicationStoryboard";
            break;
    }
    return [[UIStoryboard storyboardWithName:sb_name bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

@end
