//
//  HyMessageTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyMessageTableViewCell.h"

@implementation HyMessageTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    static  NSString *CellIdentifier = @ "HyMessageTableViewCell" ;
    HyMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@ "HyMessageTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
