//
//  HySystemCellFrame.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HySystemModel.h"
@interface HySystemCellFrame : NSObject
@property (nonatomic,strong)HySystemModel *SystemModel;

@property (nonatomic, assign, readonly)CGRect timeViewF;
@property (nonatomic, assign, readonly)CGRect timeButtonF;
@property (nonatomic, assign, readonly)CGRect topViewF;
@property (nonatomic, assign, readonly)CGRect topicalLableF;

@property (nonatomic, assign, readonly)CGRect detaileViewF;

//cell高度
@property (nonatomic, assign, readonly)CGFloat cellHeight;
@end
