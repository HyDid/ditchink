//
//  HySystemModel.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySystemModel.h"

@implementation HySystemModel
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
