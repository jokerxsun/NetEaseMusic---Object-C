//
//  SXLaunchImageAdView.m
//  chuangyezhinan
//
//  Created by sunxu on 2017/3/17.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "SXLaunchImageAdView.h"


#define mainHeight      [[UIScreen mainScreen] bounds].size.height
#define mainWidth       [[UIScreen mainScreen] bounds].size.width

@interface SXLaunchImageAdView ()

@property (nonatomic, strong) NSString *isClick;

@end

@implementation SXLaunchImageAdView

- (instancetype)initWithWindow:(UIWindow *)window type:(NSInteger)type imgUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        self.window = window;
        [window makeKeyAndVisible];
        // 获取启动图片
        CGSize viewSize = window.bounds.size;
        // 横屏请设置成 @"Landscape"
        NSString *viewOrientation = nil;
        
        if (SX_STATUSBARORIENTATION == (UIDeviceOrientationLandscapeLeft|UIDeviceOrientationLandscapeRight)) {
            viewOrientation = @"Landscape";
        } else {
            viewOrientation = @"Portrait";
        }
        
        NSString *launchImageName = nil;
        
        NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
        for (NSDictionary* dict in imagesDict) {
            CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
            if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
                launchImageName = dict[@"UILaunchImageName"];
            }
            
        }
 
        UIImage * launchImage = [UIImage imageNamed:launchImageName];
        self.backgroundColor = [UIColor colorWithPatternImage:launchImage];
        self.frame = CGRectMake(0, 0, mainWidth, mainHeight);
        if (type == FullScreenAdType) {
            self.adImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight)];
            
        }else{
            self.adImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight - mainWidth/3)];
        }
        
        self.skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.skipBtn.frame = CGRectMake(mainWidth - 70, 20, 60, 30);
        self.skipBtn.backgroundColor = [UIColor brownColor];
        self.skipBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.skipBtn addTarget:self action:@selector(skipBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.adImgView addSubview:self.skipBtn];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.skipBtn.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(15, 15)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.skipBtn.bounds;
        maskLayer.path = maskPath.CGPath;
        self.skipBtn.layer.mask = maskLayer;
        SDWebImageDownloader *downLoader = [SDWebImageDownloader sharedDownloader];
        [downLoader downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            if (image) {
                [self.adImgView setImage:[self imageCompressForWidth:image targetWidth:mainWidth]];
            }
        }];
        
        self.adImgView.tag = 1101;
        self.adImgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.adImgView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(activiTap:)];
        // 允许用户交互
        self.adImgView.userInteractionEnabled = YES;
        [self.adImgView addGestureRecognizer:tap];
        
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.duration = 0.8;
        opacityAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        opacityAnimation.toValue = [NSNumber numberWithFloat:0.8];
        
        opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        [self.adImgView.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
        
        // GCD 方法实现倒计时计数器，NSTimer 在 Runloop 中执行，不准，占用内存较高，不安全
        [self startOpenCountdown];

        [self.window addSubview:self];
    }
    return self;
}

#pragma mark - 点击广告
- (void)activiTap:(UITapGestureRecognizer*)recognizer{
    _isClick = @"1";
    [self startcloseAnimation];
}

#pragma mark - 开启关闭动画
- (void)startcloseAnimation{
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 0.5;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.3];
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    [self.adImgView.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
    [NSTimer scheduledTimerWithTimeInterval:opacityAnimation.duration
                                     target:self
                                   selector:@selector(closeAddImgAnimation)
                                   userInfo:nil
                                    repeats:NO];
    
}

- (void)skipBtnClick{
    _isClick = @"2";
    [self startcloseAnimation];
}

#pragma mark - 关闭动画完成时处理事件
-(void)closeAddImgAnimation
{
    self.hidden = YES;
    self.adImgView.hidden = YES;
    self.hidden = YES;
    if ([_isClick integerValue] == 1) {
        
        if (self.clickBlock) {// 点击广告
            self.clickBlock(1100);
        }
    }else if([_isClick integerValue] == 2){
        if (self.clickBlock) {// 点击跳过
            self.clickBlock(1101);
        }
    }else{
        if (self.clickBlock) {// 点击跳过
            self.clickBlock(1102);
        }
    }
}

#pragma mark ---- 开启倒计时
- (void)startOpenCountdown
{
    __block NSInteger secondsCountDown = 6; // 倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
   
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer,DISPATCH_TIME_NOW,1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(timer, ^{
        if(secondsCountDown <= 0) { // 倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self startcloseAnimation];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                // 设置label读秒效果
                 [self.skipBtn setTitle:[NSString stringWithFormat:@"%ld | 跳过", secondsCountDown] forState:UIControlStateNormal];
            });
            
            secondsCountDown--;
        }
    });
    
    dispatch_resume(timer);
}

#pragma mark - 指定宽度按比例缩放
- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor; 
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    //    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}

@end
