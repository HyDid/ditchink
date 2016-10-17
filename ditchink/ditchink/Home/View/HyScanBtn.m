//
//  HyScanBtn.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/16.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyScanBtn.h"

@implementation HyScanBtn


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat h = contentRect.size.height;
    CGFloat w = contentRect.size.width;
    CGFloat x = 100;
    return CGRectMake(x, 0, w, h);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat h = 100;
    CGFloat w = 100;
    CGFloat x = -60;
    CGFloat y = -50;
    return CGRectMake(x, y, w, h);
}




@end
