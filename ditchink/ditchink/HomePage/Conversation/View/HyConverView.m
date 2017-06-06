//
//  HyConverView.m
//  ditchink
//
//  Created by LiHongYu on 2017/6/6.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import "HyConverView.h"

@interface HyConverView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *levelLab;
@property (weak, nonatomic) IBOutlet UILabel *strLab;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
@implementation HyConverView


+(instancetype)ConverViewWithView:(HyConver *)conver{
    NSBundle *bundle = [NSBundle mainBundle];
    // 读取xib文件(会创建xib中的描述的所有对象,并且按顺序放到数组中返回)
    NSArray *objs = [bundle loadNibNamed:@"HyConverView" owner:nil options:nil];
    HyConverView *ConverView = [objs lastObject];
    ConverView.conver= conver;
    return ConverView;
}
+(instancetype)ConverView{
    return [self ConverViewWithView:nil];
}

-(void)setConver:(HyConver *)conver{
    
    _conver = conver;
    self.iconView.image = [UIImage imageNamed:conver.icon];
    self.nameLab.text = conver.name;
    self.levelLab.text = conver.level;
    self.strLab.text =conver.str;
}

@end
