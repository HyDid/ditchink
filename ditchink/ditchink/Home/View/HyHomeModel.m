//
//  HyHomeModel.m
//  ditchink
//
//  Created by Song on 16/10/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHomeModel.h"

@implementation HyHomeModel

+(instancetype)HyWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
