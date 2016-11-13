//
//  HySystemViewTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySystemViewTableViewCell.h"

@interface HySystemViewTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UILabel *topicalLable;

@end
@implementation HySystemViewTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HySystemViewTableViewCell" ;
    HySystemViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HySystemViewTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

-(void)awakeFromNib{
    [super awakeFromNib];

    [self.timeButton setBackgroundImage:[UIImage imageNamed:@"icon-time"] forState:UIControlStateNormal];
    [self.timeButton setUserInteractionEnabled:NO];
}

-(void)setSystemModel:(HySystemModel *)systemModel{
    self.timeButton.titleLabel.text = systemModel.timeStr;
    self.topicalLable.text = systemModel.topicalStr;
    
}


@end
