//
//  HyConverView.h
//  ditchink
//
//  Created by LiHongYu on 2017/6/6.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HyConver.h"

@interface HyConverView : UIView

@property (nonatomic, strong) HyConver *conver;
+(instancetype)ConverView;
+(instancetype)ConverViewWithView:(HyConver *)conver;
@end
