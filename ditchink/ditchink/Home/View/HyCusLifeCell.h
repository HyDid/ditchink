//
//  HyCusLifeCell.h
//  ditchink
//
//  Created by Song on 16/11/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class HyCusLife;

@interface HyCusLifeCell : UITableViewCell

// 通过tableview创建cell
+(instancetype)cellWithTableView:(UITableView *)tableView;

// 模型
@property(nonatomic,strong) HyCusLifeCell *model;

@end
