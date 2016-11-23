//
//  HyNearbyPersonTableViewCell.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/23.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HyNearbyPersonModel.h"

@interface HyNearbyPersonTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)HyNearbyPersonModel *NearbyPersonModel;
@end
