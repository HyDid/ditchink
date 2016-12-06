//
//  MJMessage.h
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MJMessageTypeMe = 0, // 自己发的
    MJMessageTypeOther   // 别人发的
} MJMessageType;

@interface MJMessage : NSObject
/**
 *  聊天内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *  发送时间
 */
@property (nonatomic, copy) NSString *time;
/**
 *  信息的类型
 */
@property (nonatomic, assign) MJMessageType type;

/**
 *  是否隐藏时间
 */
@property (nonatomic, assign) BOOL hideTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
