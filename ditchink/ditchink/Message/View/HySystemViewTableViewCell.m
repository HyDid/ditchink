//
//  HySystemViewTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/31.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySystemViewTableViewCell.h"

@interface HySystemViewTableViewCell()
//@property (weak, nonatomic) IBOutlet UIButton *timeButton;
//@property (weak, nonatomic) IBOutlet UILabel *topicalLable;
//@property (weak, nonatomic) IBOutlet UITextView *DetailTextView;

@property (strong, nonatomic)UIView *timeView;
@property (strong, nonatomic)UIView *topView;
@property (strong, nonatomic)UITextView *detaileView;

@property (strong, nonatomic) UIButton *timeButton;
@property (strong, nonatomic)UILabel *topicalLable;
@end
@implementation HySystemViewTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static  NSString *CellIdentifier = @"HySystemViewTableViewCell" ;
    HySystemViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"HySystemViewTableViewCell"  owner:self options:nil] lastObject];
        cell = [[HySystemViewTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    return cell;
}

//-(void)awakeFromNib{
//    [super awakeFromNib];
//    [self.timeButton setBackgroundImage:[UIImage imageNamed:@"icon-time"] forState:UIControlStateNormal];
//    [self.timeButton setUserInteractionEnabled:NO];
//}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupTopView];

    }
    return self;
}
- (void)setupTopView
{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *timeView = [[UIView alloc]init];
    UIButton *timeButton = [[UIButton alloc]init];
    timeButton.titleLabel.font = [UIFont systemFontOfSize:9];
    timeButton.titleLabel.textColor = [UIColor whiteColor];

    [timeButton setBackgroundImage:[UIImage imageNamed:@"icon-time"] forState:UIControlStateNormal];
    //[timeButton setUserInteractionEnabled:NO];
    self.timeButton = timeButton;
    [timeView addSubview:timeButton];
    [self.contentView addSubview:timeView];
    self.timeView = timeView;
    
    UIView *topView = [[UIView alloc]init];
    UILabel *topicalLable = [[UILabel alloc]init];
    topicalLable.font = [UIFont systemFontOfSize:12];
    self.topicalLable = topicalLable;
    [topView addSubview:topicalLable];
    topView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:topView];
    self.topView = topView;
    
    UITextView *detaileView = [[UITextView alloc]init];

    detaileView.textColor = [UIColor lightGrayColor];
    detaileView.backgroundColor = [UIColor whiteColor];
    detaileView.scrollEnabled= NO;
    detaileView.editable = NO;
//    detaileView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 25;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:12],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    detaileView.attributedText = [[NSAttributedString alloc]init];
//    detaileView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:detaileView];
    self.detaileView = detaileView;

}

-(void)setSystemCellFrame:(HySystemCellFrame *)SystemCellFrame{
    
    _SystemCellFrame = SystemCellFrame;
    
    [self setTimeViewDate];
    [self setTopViewDate];
    [self setDetaileViewDate];
}
-(void)setTimeViewDate{
    self.timeView.frame = _SystemCellFrame.timeViewF;
    self.timeButton.frame = _SystemCellFrame.timeButtonF;
    [self.timeButton setTitle:_SystemCellFrame.SystemModel.timeStr forState:UIControlStateNormal];
}
-(void)setTopViewDate{
    self.topView.frame = _SystemCellFrame.topViewF;
    self.topicalLable.frame = _SystemCellFrame.topicalLableF;
    self.topicalLable.text = _SystemCellFrame.SystemModel.topicalStr;
}
-(void)setDetaileViewDate{
    self.detaileView.frame = _SystemCellFrame.detaileViewF;
    self.detaileView.text = _SystemCellFrame.SystemModel.detailsStr;
}

/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 5;
    frame.origin.x = 20;
    frame.size.width -= 2 * 20;
    frame.size.height -= 5;
    [super setFrame:frame];
}









//-(void)layoutSubviews{
//    [super layoutSubviews];
    
//    self.DetailTextView.frame = CGRectMake(0, 55, 350, 70);
//    self.height = CGRectGetMaxY(CGRectMake(0, 55, 350, 90));
//}

//-(void)setSystemModel:(HySystemModel *)systemModel{
    
//    [self.timeButton setTitle:systemModel.timeStr forState:UIControlStateNormal];
//    self.topicalLable.text = systemModel.topicalStr;
//    self.DetailTextView.text = systemModel.detailsStr;
    
//}



@end
