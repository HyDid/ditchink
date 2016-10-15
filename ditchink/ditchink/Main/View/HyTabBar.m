//
//  HyTabBar.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyTabBar.h"
#import "HyTabBarButton.h"


@interface HyTabBar()
@property(strong,nonatomic)NSMutableArray *tabBarButtons;
@property (weak, nonatomic)HyTabBarButton *selectedButton;
@end

@implementation HyTabBar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    }
    return self;
}
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;
{
    // 1.创建按钮
    HyTabBarButton *button = [[HyTabBarButton alloc] init];
    
    // 2.传递模型数据
    button.item = item;
    
    // 3.添加按钮
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    
    // 4.默认选中
    if (self.tabBarButtons.count == 2) {
        [self buttonClick:button];
    }


}
- (void)buttonClick:(HyTabBarButton *)button
{
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    
    // 1.控制器选中按钮
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width / 3;
    CGFloat buttonH = self.frame.size.height;
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        HyTabBarButton *button = self.tabBarButtons[index];
        button.tag = index;
        CGFloat buttonX = index * buttonW;

        button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
    }
    

}


@end
