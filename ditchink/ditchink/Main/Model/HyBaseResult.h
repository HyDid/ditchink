//
//  HyBaseResult.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyBaseResult : NSObject

/**
 *  成功标志
 */
@property (nonatomic, assign) Boolean success;
/**
 *  消息
 */
@property (nonatomic, copy) NSString *msg;
/**
 *  判断token是否过期
 */
@property (nonatomic, assign) Boolean isToken;

@end
