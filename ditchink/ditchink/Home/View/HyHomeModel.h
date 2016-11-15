//
//  HyHomeModel.h
//  ditchink
//
//  Created by Song on 16/10/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyHomeModel : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *intro1;
@property(nonatomic,copy) NSString *intro2;

+(instancetype) HyWithDict:(NSDictionary *)dict;
-(instancetype) initWithDict:(NSDictionary *)dict;

@end
