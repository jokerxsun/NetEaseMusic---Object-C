//
//  UIViewController+SX.h
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/22.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ErrorType) {
    ErrorTypeNetwork = 0,
    ErrorTypeEmptyDownload,
    ErrorTypeEmptyBox,
    ErrorTypeEmptyMessage,
    ErrorTypeEmptySubscribe,
    ErrorTypeEmptySearch,
    ErrorTypeEmptyBook,
    ErrorTypeEmptyShopCar,
    ErrorTypeEmptyOther
};
typedef NS_ENUM(NSInteger, StoryboardType) {
    StoryboardTypeDefault = 0,
    StoryboardTypeMall
};

@interface UIViewController (SX)

+ (instancetype)loadVCFromStoryboard:(StoryboardType)type;

- (void)showErrorView:(ErrorType)type;

- (void)hideErrorView;

- (void)emptyDataClick;

@end
