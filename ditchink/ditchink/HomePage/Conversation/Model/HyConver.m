//
//  HyConver.m
//  ditchink
//
//  Created by LiHongYu on 2017/6/6.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import "HyConver.h"

@implementation HyConver

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {        
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
        self.level = dict[@"level"];
        self.str = dict[@"str"];
    }
    return self;
}

+ (instancetype)ConverWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
