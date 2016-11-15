//
//  HyCustomCell.h
//  ditchink
//
//  Created by Song on 16/10/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HyHomeModel;

@interface HyCustomCell : UITableViewCell

// 通过tableview来创建一个cell
+(instancetype)cellWithTableView:(UITableView *)tableView;

// 模型
@property(nonatomic,strong) HyHomeModel *modelll;

@end
