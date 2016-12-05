//
//  HyNearbyCircleTalkModel.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyCircleTalkModel.h"

@implementation HyNearbyCircleTalkModel

+(instancetype)ModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
