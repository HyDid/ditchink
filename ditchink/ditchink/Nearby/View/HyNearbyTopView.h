//
//  HyNearbyTopView.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HyNearbyTopView;
@protocol HyNearbyTopViewDelegate <NSObject>
@optional
-(void)HyNearbyTopView:(HyNearbyTopView *)NearbyTopView didSelectedButtonFrom:(int)from to:(int)to;
@end


@interface HyNearbyTopView : UIView

@property (nonatomic, weak) UIButton *personButton;
@property (nonatomic, weak) UIButton *thingButton;
@property (nonatomic, weak) UIButton *mineButton;
@property (nonatomic, weak) UIButton *moreButton;
@property (nonatomic, weak) id<HyNearbyTopViewDelegate> delegate;

@end
