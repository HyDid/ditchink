//
//  HyCustomCell.m
//  ditchink
//
//  Created by Song on 16/10/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyCustomCell.h"
#import "HyHomeModel.h"

@interface HyCustomCell() <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *intro1View;
@property (weak, nonatomic) IBOutlet UILabel *intro2View;

@end

@implementation HyCustomCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    // 优化
    static NSString *ID = @"hy"; // 1.用static修饰局部变量，只分配一次存储空间，只初始化一次。绑定标识
    HyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:ID]; // 2.先从缓存池里取
    if (cell == nil) { // 3.如果缓存池为空，就创建
        // 用xib创建自定义cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HyCustomCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModelll:(HyHomeModel *)modelll {
    // 重写set方法
    _modelll = modelll;
    
    self.iconView.image = [UIImage imageNamed:_modelll.icon];
    self.titleView.text = _modelll.title;
    self.intro1View.text = _modelll.intro1;
    self.intro2View.text = _modelll.intro2;
    
//    [self addSubview:<#(nonnull UIView *)#>];
}

@end
