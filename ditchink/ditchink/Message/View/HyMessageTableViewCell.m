//
//  HyMessageTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyMessageTableViewCell.h"

@interface HyMessageTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *detailsLable;


@end
@implementation HyMessageTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    static  NSString *CellIdentifier = @"HyMessageTableViewCell" ;
    HyMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyMessageTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

-(void)setMessageModel:(HyMessageModel *)messageModel{
    self.nameLable.text = messageModel.nameStr;
    self.timeLable.text = messageModel.timeStr;
    self.detailsLable.text = messageModel.detailsStr;
}

@end
