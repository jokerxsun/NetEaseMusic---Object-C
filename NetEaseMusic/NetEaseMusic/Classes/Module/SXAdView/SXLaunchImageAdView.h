//
//  SXLaunchImageAdView.h
//  chuangyezhinan
//
//  Created by sunxu on 2017/3/17.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "BaseView.h"
#import "SDWebImageDownloader.h"

typedef NS_ENUM(NSInteger, AdType) {
    LogoAdType = 0, // Logo 在底部类型广告页
    FullScreenAdType, // 无 logo 全屏幕广告
};

typedef void (^SXAdViewClick) (NSInteger tag);

@interface SXLaunchImageAdView : BaseView

@property (nonatomic, strong) UIImageView *adImgView;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) NSInteger adTime; //倒计时总时长,默认6秒
@property (nonatomic, strong) UIButton *skipBtn;

@property (nonatomic, copy) SXAdViewClick clickBlock;

/**
  重写 init 方法，生成广告页
 @param window windoe
 @param type AdType
 @param url imageUrls
 @return self;
 */
- (instancetype)initWithWindow:(UIWindow *)window type:(NSInteger)type imgUrl:(NSString *)url;

@end
