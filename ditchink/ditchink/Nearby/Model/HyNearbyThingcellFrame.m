//
//  HyNearbyThingcellFrame.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyThingcellFrame.h"

@implementation HyNearbyThingcellFrame

-(void)setNearbyThingModel:(HyNearbyThingModel *)NearbyThingModel{
    _NearbyThingModel = NearbyThingModel;
    
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 2 * 5;
    
    // 1.topView
    CGFloat topViewW = cellW;
    CGFloat topViewH = 0;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    
    // 2.头像
    CGFloat iconViewWH = 35;
    CGFloat iconViewX = 5;
    CGFloat iconViewY = 5;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    
    // 3.昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + 5;
    CGFloat nameLabelY = iconViewY;
    CGSize nameLabelSize = [NearbyThingModel.nameLabelStr sizeWithFont:[UIFont systemFontOfSize:12]];
    _nameLabelF = (CGRect){{nameLabelX, nameLabelY}, nameLabelSize};
    
    // 5.时间
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelF) + 5 * 0.5;
    CGSize timeLabelSize = [NearbyThingModel.timeLabelStr sizeWithFont:[UIFont systemFontOfSize:12]];
    _timeLabelF = (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    
    // 7.正文内容
    CGFloat contentLabelX = iconViewX;
    CGFloat contentLabelY = MAX(CGRectGetMaxY(_timeLabelF), CGRectGetMaxY(_iconViewF)) + 5 * 0.5;
    CGFloat contentLabelMaxW = topViewW - 2 * 5;
    CGSize contentLabelSize = [NearbyThingModel.contentLabelStr sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
    _contentLabelF = (CGRect){{contentLabelX, contentLabelY}, contentLabelSize};
    
    
    
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);

    // 14.cell的高度
    _cellHeight = 140;
//    _cellHeight = CGRectGetMaxY(_topViewF) + 5;
}
@end
