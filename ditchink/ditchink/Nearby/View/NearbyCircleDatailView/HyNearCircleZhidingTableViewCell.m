//
//  HyNearCircleZhidingTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearCircleZhidingTableViewCell.h"

@implementation HyNearCircleZhidingTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HyNearCircleZhidingTableViewCell" ;
    HyNearCircleZhidingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyNearCircleZhidingTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

@end
