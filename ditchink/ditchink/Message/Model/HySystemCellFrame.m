//
//  HySystemCellFrame.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySystemCellFrame.h"

@implementation HySystemCellFrame


-(void)setSystemModel:(HySystemModel *)SystemModel{
    _SystemModel = SystemModel;
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 2 * 20;
    



    _timeButtonF = CGRectMake((cellW)/2-30, 7, 60, 12);
    _topicalLableF = CGRectMake(10, 0, 100, 22);
    
    
    _timeViewF = CGRectMake(0, 0, cellW, 20);
    _topViewF = CGRectMake(0, 25, cellW, 22 );
    
    
    if (SystemModel.detailsStr.length <= 27) {
        _detaileViewF = CGRectMake(0, 49, cellW, 20);
    }else if (SystemModel.detailsStr.length > 27 && SystemModel.detailsStr.length <= 54 ){
        _detaileViewF = CGRectMake(0, 49, cellW, 40);
    }else if (SystemModel.detailsStr.length > 54){
        _detaileViewF = CGRectMake(0, 49, cellW, 80);
    }
    
    
    
    _cellHeight = CGRectGetMaxY(_detaileViewF)+5;

    
}
@end
