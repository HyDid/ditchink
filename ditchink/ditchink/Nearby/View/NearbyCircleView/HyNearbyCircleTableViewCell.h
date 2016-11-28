//
//  HyNearbyCircleTableViewCell.h
//  ditchink
//
//  Created by LiHongYu on 2016/11/28.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HyNearbyCircleModel.h"
@interface HyNearbyCircleTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)HyNearbyCircleModel *CircleModel;
@property (weak, nonatomic) IBOutlet UIButton *CircleAddBtn;
@end
