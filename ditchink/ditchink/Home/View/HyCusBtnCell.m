//
//  HyCusBtnCell.m
//  ditchink
//
//  Created by Song on 16/11/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyCusBtnCell.h"
//#import "HyFourBtnModel.h"

@interface HyCusBtnCell()

@property (weak, nonatomic) IBOutlet UILabel *titleView1;
@property (weak, nonatomic) IBOutlet UILabel *titleView2;
@property (weak, nonatomic) IBOutlet UILabel *titleView3;
@property (weak, nonatomic) IBOutlet UILabel *titleView4;




@end

@implementation HyCusBtnCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"btn";
    HyCusBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyCusBtnCell" owner:nil options:nil]lastObject];
    }
    [cell.iconView1 setBackgroundImage:[UIImage imageNamed:@"icon-parents"] forState:UIControlStateNormal];
    cell.titleView1.text = @"情景对话";
    
    [cell.iconView2 setBackgroundImage:[UIImage imageNamed:@"icon-specialist"] forState:UIControlStateNormal];
    cell.titleView2.text = @"专家咨询";
    
    [cell.iconView3 setBackgroundImage:[UIImage imageNamed:@"icon-case"] forState:UIControlStateNormal];
    cell.titleView3.text = @"案例介绍";
    
    [cell.iconView4 setBackgroundImage:[UIImage imageNamed:@"icon-book"] forState:UIControlStateNormal];
    cell.titleView4.text = @"图书推荐";
    return cell;
}

@end
