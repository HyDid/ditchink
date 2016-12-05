//
//  HyNearCircleTalkTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearCircleTalkTableViewCell.h"

@interface HyNearCircleTalkTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *fromLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end
@implementation HyNearCircleTalkTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HyNearCircleTalkTableViewCell" ;
    HyNearCircleTalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyNearCircleTalkTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

-(void)setTalkModel:(HyNearbyCircleTalkModel *)TalkModel{
    self.titleLab.text = TalkModel.titleLabStr;
    self.fromLab.text = TalkModel.fromLabStr;
    self.timeLab.text = TalkModel.timeLabStr;
}

@end
