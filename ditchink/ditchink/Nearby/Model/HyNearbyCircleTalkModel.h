//
//  HyNearbyCircleTalkModel.h
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyNearbyCircleTalkModel : NSObject
@property(nonatomic,copy)NSString *titleLabStr;
@property(nonatomic,copy)NSString *fromLabStr;
@property(nonatomic,copy)NSString *timeLabStr;
+(instancetype) ModelWithDict:(NSDictionary *)dict;
-(instancetype) initWithDict:(NSDictionary *)dict;
@end
