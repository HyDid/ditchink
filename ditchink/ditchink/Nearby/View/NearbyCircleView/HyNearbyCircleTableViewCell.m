//
//  HyNearbyCircleTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/28.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyCircleTableViewCell.h"

@interface HyNearbyCircleTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *IconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *marryLab;

@end
@implementation HyNearbyCircleTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HyNearbyCircleTableViewCell" ;
    HyNearbyCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyNearbyCircleTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

-(void)setCircleModel:(HyNearbyCircleModel *)CircleModel{
    self.IconView.image = [UIImage imageNamed:CircleModel.IconViewStr];
    self.nameLab.text = CircleModel.nameLabStr;
    self.detailLab.text = CircleModel.detailLabStr;
    self.marryLab.text = CircleModel.marryLabStr;
}

@end
