//
//  HyNearbyCircleAddTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/28.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyCircleAddTableViewCell.h"

@implementation HyNearbyCircleAddTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HyNearbyCircleAddTableViewCell" ;
    HyNearbyCircleAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyNearbyCircleAddTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}
@end
