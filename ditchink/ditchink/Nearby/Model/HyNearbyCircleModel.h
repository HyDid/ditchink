//
//  HyNearbyCircleModel.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/28.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyNearbyCircleModel : NSObject

@property(nonatomic,copy)NSString *IconViewStr;
@property(nonatomic,copy)NSString *nameLabStr;
@property(nonatomic,copy)NSString *detailLabStr;
@property(nonatomic,copy)NSString *marryLabStr;

+(instancetype) ModelWithDict:(NSDictionary *)dict;
-(instancetype) initWithDict:(NSDictionary *)dict;
@end
