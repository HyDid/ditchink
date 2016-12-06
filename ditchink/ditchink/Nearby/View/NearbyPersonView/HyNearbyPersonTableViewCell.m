//
//  HyNearbyPersonTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/23.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyPersonTableViewCell.h"

@interface HyNearbyPersonTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *nearIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nearNameLab;
@property (weak, nonatomic) IBOutlet UILabel *nearChildLab;
@property (weak, nonatomic) IBOutlet UILabel *nearQuestionLab;
@property (weak, nonatomic) IBOutlet UILabel *nearLocationLab;



@end

@implementation HyNearbyPersonTableViewCell



+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HyNearbyPersonTableViewCell" ;
    HyNearbyPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyNearbyPersonTableViewCell"  owner:self options:nil] lastObject];
    }
    return cell;
}

-(void)setNearbyPersonModel:(HyNearbyPersonModel *)NearbyPersonModel{
    
    self.nearIconImageView.image = [UIImage imageNamed:NearbyPersonModel.nearIconStr];
    self.nearNameLab.text = NearbyPersonModel.nearnameStr;
    self.nearChildLab.text = NearbyPersonModel.nearChildStr;
    self.nearQuestionLab.text = NearbyPersonModel.nearQuestionStr;
    self.nearLocationLab.text = NearbyPersonModel.nearLocationStr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
