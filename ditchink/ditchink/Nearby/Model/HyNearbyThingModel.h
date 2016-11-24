//
//  HyNearbyThingModel.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyNearbyThingModel : NSObject

/** 头像 */
@property (nonatomic, copy) NSString *iconViewStr;
/** 昵称 */
@property (nonatomic, copy) NSString *nameLabelStr;
/** 正文\内容 */
@property (nonatomic, copy) NSString *contentLabelStr;
/** 时间 */
@property (nonatomic, copy) NSString *timeLabelStr;

@end
