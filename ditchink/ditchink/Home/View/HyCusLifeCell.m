//
//  HyCusLifeCell.m
//  ditchink
//
//  Created by Song on 16/11/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyCusLifeCell.h"
//#import "HyCusLife.h"

@interface HyCusLifeCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *cameraView;


@end


@implementation HyCusLifeCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    // 优化
    static NSString *ID = @"hy"; // 1.用static修饰局部变量，只分配一次存储空间，只初始化一次。绑定标识
    HyCusLifeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID]; // 2.先从缓存池里取
    if (cell == nil) { // 3.如果缓存池为空，就创建
        // 用xib创建自定义cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyCusLifeCell" owner:nil options:nil] lastObject];
    }
    cell.iconView.image = [UIImage imageNamed:@"icon-photo"];
    cell.titleView.text = @"记录我的生活";
    cell.titleView.textColor = [UIColor lightGrayColor];
    cell.cameraView.image = [UIImage imageNamed:@"icon-camera"];
    return cell;
}

@end
