//
//  HySystemModel.h
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HySystemModel : NSObject


@property (nonatomic,copy)NSString *timeStr;
@property (nonatomic,copy)NSString *topicalStr;
@property (nonatomic,copy)NSString *detailsStr;

+(instancetype) ModelWithDict:(NSDictionary *)dict;
-(instancetype) initWithDict:(NSDictionary *)dict;
@end
