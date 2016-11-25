//
//  HyNearbyThingTopView.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyThingTopView.h"

#import "HyNearbyThingModel.h"
#import "HyNearbyThingcellFrame.h"

@interface HyNearbyThingTopView()
/** 头像 */
@property (nonatomic, weak) UIImageView *iconView;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 正文\内容 */
@property (nonatomic, weak) UILabel *contentLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;

@property (nonatomic, weak) UIButton *answerBtn;
@end
@implementation HyNearbyThingTopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        /** 头像 */
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        /** 昵称 */
        UILabel *nameLabel = [[UILabel alloc] init];

        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 正文\内容 */
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = [UIColor lightGrayColor];
        contentLabel.font = [UIFont systemFontOfSize:12];
        contentLabel.backgroundColor = [UIColor clearColor];
 //       [contentLabel sizeToFit];
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        /** 6.时间 */
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = [UIColor lightGrayColor];
        timeLabel.font = [UIFont systemFontOfSize:10];
        timeLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
    }
    return self;
}

-(void)setNearbyThingcellFrame:(HyNearbyThingcellFrame *)NearbyThingcellFrame{
    _NearbyThingcellFrame = NearbyThingcellFrame;
    
    HyNearbyThingModel *NearbyThingModel = NearbyThingcellFrame.NearbyThingModel;
    
    // 2.头像
//    [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:NearbyThingModel.iconViewStr]];
    [self.iconView setImage:[UIImage imageNamed:NearbyThingModel.iconViewStr]];
    self.iconView.frame = self.NearbyThingcellFrame.iconViewF;
    
    // 3.昵称
    self.nameLabel.text = NearbyThingModel.nameLabelStr;
    self.nameLabel.frame = self.NearbyThingcellFrame.nameLabelF;

    // 7.正文
    self.contentLabel.text = NearbyThingModel.contentLabelStr;
    self.contentLabel.frame = self.NearbyThingcellFrame.contentLabelF;

    // 5.时间
    self.timeLabel.text = NearbyThingModel.timeLabelStr;
    self.timeLabel.frame = self.NearbyThingcellFrame.timeLabelF;
    
    
}

@end
