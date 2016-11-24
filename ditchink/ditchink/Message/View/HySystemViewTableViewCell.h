//
//  HySystemViewTableViewCell.h
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HySystemModel.h"
#import "HySystemCellFrame.h"
@interface HySystemViewTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
//@property(nonatomic,strong)HySystemModel *systemModel;
@property(nonatomic,strong)HySystemCellFrame *SystemCellFrame;
@property(nonatomic,assign)CGFloat height;


@end
