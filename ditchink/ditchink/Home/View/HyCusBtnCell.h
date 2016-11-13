//
//  HyCusBtnCell.h
//  ditchink
//
//  Created by Song on 16/11/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HyFourBtnModel;

@interface HyCusBtnCell : UITableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong) HyFourBtnModel *modelbtn;

@end
