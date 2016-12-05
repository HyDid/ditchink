//
//  HyNearCircleTalkTableViewCell.h
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HyNearbyCircleTalkModel.h"
@interface HyNearCircleTalkTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)HyNearbyCircleTalkModel *TalkModel;
@end
