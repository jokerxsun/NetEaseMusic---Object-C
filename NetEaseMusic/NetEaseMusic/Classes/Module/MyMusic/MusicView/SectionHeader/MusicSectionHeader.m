//
//  MusicSectionHeader.m
//  NetEaseMusic
//
//  Created by sunxu on 2017/3/23.
//  Copyright © 2017年 Sun Xu. All rights reserved.
//

#import "MusicSectionHeader.h"

@interface MusicSectionHeader ()

@property (weak, nonatomic) IBOutlet UILabel *sectionHeaderTitle;


@end

@implementation MusicSectionHeader

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundView = ({
        UIView* view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = SXHEXCOLOR(0xefeff4);
        view;
    });
}

- (void)setSection:(NSInteger)section
{
    NSString *title = nil;
    switch (section) {
        case 1:
            title = @"我创建的歌单(12)";
            break;
        case 2:
            title = @"我收藏的歌单(41)";
            break;
        default:
            break;
    }

    self.sectionHeaderTitle.text = title;
}

#pragma mark ---- type
- (instancetype)showSectionHeader:(SectionHeaderType)type
{
    NSString *title = nil;
    switch (type) {
        case SXMusicSectionHeaderTypeCreate:
            title = @"我创建的歌单(12)";
            break;
        case SXMusicSectionHeaderTypeFavorite:
            title = @"我收藏的歌单(41)";
            break;
        default:
            break;
    }
    
    return self;
}

@end
