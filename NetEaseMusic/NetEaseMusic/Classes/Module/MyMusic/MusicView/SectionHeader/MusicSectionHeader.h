//
//  MusicSectionHeader.h
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/23.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SectionHeaderType) {
    SXMusicSectionHeaderTypeCreate = 0,
    SXMusicSectionHeaderTypeFavorite
};

@interface MusicSectionHeader : UITableViewHeaderFooterView

- (instancetype)showSectionHeader:(SectionHeaderType)type;

@property (nonatomic, assign) NSInteger section;

@end
