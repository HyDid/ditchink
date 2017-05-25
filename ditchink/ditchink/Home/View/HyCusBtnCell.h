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

@property (weak, nonatomic) IBOutlet UIButton *iconView1;
@property (weak, nonatomic) IBOutlet UIButton *iconView2;
@property (weak, nonatomic) IBOutlet UIButton *iconView3;
@property (weak, nonatomic) IBOutlet UIButton *iconView4;

@property(nonatomic,strong) HyFourBtnModel *modelbtn;

@end
