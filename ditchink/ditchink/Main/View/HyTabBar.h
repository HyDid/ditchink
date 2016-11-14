//
//  HyTabBar.h
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HyTabBar;

@protocol HyTabBarDelegate <NSObject>
@optional
- (void)tabBar:(HyTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
@end

@interface HyTabBar : UIView

-(void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<HyTabBarDelegate> delegate;
@end
