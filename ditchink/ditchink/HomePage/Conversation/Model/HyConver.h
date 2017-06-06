//
//  HyConver.h
//  ditchink
//
//  Created by LiHongYu on 2017/6/6.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyConver : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *str;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)ConverWithDict:(NSDictionary *)dict;
@end
