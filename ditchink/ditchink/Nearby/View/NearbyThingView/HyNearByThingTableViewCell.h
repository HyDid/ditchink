//
//  HyNearByThingTableViewCell.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HyNearbyThingcellFrame.h"
@interface HyNearByThingTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) HyNearbyThingcellFrame *NearbyThingcellFrame;
@end
