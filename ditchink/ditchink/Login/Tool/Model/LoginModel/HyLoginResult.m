//
//  HyLoginResult.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/8.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyLoginResult.h"

@implementation HyLoginResult


/**
 *  从文件中解析对象的时候调
 */
-(instancetype)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.isToken = [decoder decodeBoolForKey:@"isToken"];
    }

    return self;
}


/**
 *  将对象写入文件的时候调用
 */
-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeBool:self.isToken forKey:@"isToken"];
}
@end
