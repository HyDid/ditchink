//
//  HyNearByThingTableViewCell.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/24.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearByThingTableViewCell.h"
#import "HyNearbyThingTopView.h"
#import "HyNearbyThingWriteView.h"


@interface HyNearByThingTableViewCell()

@property (nonatomic, weak) HyNearbyThingTopView *topView;
@property (nonatomic, weak) HyNearbyThingWriteView *WriteView;

@end
@implementation HyNearByThingTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static  NSString *CellIdentifier = @"HyNearByThingTableViewCell" ;
    HyNearByThingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if  (cell == nil) {
        cell = [[HyNearByThingTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupTopView];
        
        
        [self setupStatusToolbar];
    }
    return self;
}
- (void)setupTopView
{
    // 设置cell选中时的背景
//    self.selectedBackgroundView = [[UIView alloc] init];
//    self.backgroundColor = [UIColor clearColor];
    
    HyNearbyThingTopView *topView = [[HyNearbyThingTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

- (void)setupStatusToolbar
{
    HyNearbyThingWriteView *WriteView = [[HyNearbyThingWriteView alloc] init];
    [self.contentView addSubview:WriteView];
    self.WriteView = WriteView;
}

/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 5;
    frame.origin.x = 5;
    frame.size.width -= 2 * 5;
    frame.size.height -= 5;
    [super setFrame:frame];
}


- (void)setNearbyThingcellFrame:(HyNearbyThingcellFrame *)NearbyThingcellFrame
{
    _NearbyThingcellFrame = NearbyThingcellFrame;
    
    [self setupTopViewData];
    
    [self setupWriteViewData];
}


- (void)setupTopViewData
{

    self.topView.frame = self.NearbyThingcellFrame.topViewF;

    self.topView.NearbyThingcellFrame = self.NearbyThingcellFrame;
}


- (void)setupWriteViewData
{
    self.WriteView.frame = self.NearbyThingcellFrame.writeViewF;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
