//
//  HyNearbyCircleModel.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/28.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyCircleModel.h"

@implementation HyNearbyCircleModel

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
