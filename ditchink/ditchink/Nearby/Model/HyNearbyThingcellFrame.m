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
    
    //头像
    CGFloat iconViewWH = 60;
    CGFloat iconViewX = 5;
    CGFloat iconViewY = 5;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    
    //昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + 10;
    CGFloat nameLabelY = iconViewY +10;
    _nameLabelF = CGRectMake(nameLabelX, nameLabelY, 80, 20);
    
    // 正文内容
    CGFloat contentLabelX = nameLabelX;
    CGFloat contentLabelY = CGRectGetMaxY(_nameLabelF) ;
    CGFloat contentLabelMaxW = topViewW - contentLabelX - 10;
//    CGSize contentLabelSize = [NearbyThingModel.contentLabelStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12] }];
 //   CGSize contentLabelSize = [NearbyThingModel.contentLabelStr sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
  //  _contentLabelF = (CGRect){{contentLabelX, contentLabelY}, contentLabelSize};

#define mark
    if (NearbyThingModel.contentLabelStr.length <= 22) {
       _contentLabelF = CGRectMake(contentLabelX, contentLabelY, contentLabelMaxW, 20);
    }else if (NearbyThingModel.contentLabelStr.length > 22 && NearbyThingModel.contentLabelStr.length <= 44 ){
       _contentLabelF = CGRectMake(contentLabelX, contentLabelY, contentLabelMaxW, 40);
    }else if (NearbyThingModel.contentLabelStr.length > 44 && NearbyThingModel.contentLabelStr.length <= 66){
        _contentLabelF = CGRectMake(contentLabelX, contentLabelY, contentLabelMaxW, 60);
    }else if (NearbyThingModel.contentLabelStr.length > 66){
        _contentLabelF = CGRectMake(contentLabelX, contentLabelY, contentLabelMaxW, 80);
    }
    
   
   
    
    
    
    
    
    // 时间
    CGFloat timeLabelX = iconViewX;
    CGFloat timeLabelY = MAX(CGRectGetMaxY(_contentLabelF), CGRectGetMaxY(_iconViewF)) + 5 * 0.5;
    CGSize timeLabelSize = [NearbyThingModel.timeLabelStr sizeWithFont:[UIFont systemFontOfSize:12]];
 //   _timeLabelF = (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    _timeLabelF = CGRectMake(timeLabelX, timeLabelY, 100, 20);

    
    topViewH = CGRectGetMaxY(_timeLabelF);
    
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);

    // 14.cell的高度
    _cellHeight = 140;
    _cellHeight = CGRectGetMaxY(_topViewF) + 5;
}
@end
