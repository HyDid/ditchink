//
//  HyNearbyThingcellFrame.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HyNearbyThingModel.h"
@interface HyNearbyThingcellFrame : NSObject
@property (nonatomic, strong) HyNearbyThingModel *NearbyThingModel;

/** 顶部的view */
@property (nonatomic, assign, readonly)CGRect topViewF;
/** 评论的view */
@property (nonatomic, assign, readonly)CGRect writeViewF;

/** 头像 */
@property (nonatomic, assign, readonly)CGRect iconViewF;
/** 昵称 */
@property (nonatomic, assign, readonly)CGRect nameLabelF;
/** 正文\内容 */
@property (nonatomic, assign, readonly)CGRect contentLabelF;
/** 时间 */
@property (nonatomic, assign, readonly)CGRect timeLabelF;

//cell高度
@property (nonatomic, assign, readonly)CGFloat cellHeight;


@end
