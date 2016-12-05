//
//  HynearCircleDarentangTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HynearCircleDarentangTableViewCell.h"

@implementation HynearCircleDarentangTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HynearCircleDarentangTableViewCell" ;
    HynearCircleDarentangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HynearCircleDarentangTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

@end
