//
//  HyNearbyTopView.m
//  ditchink
//
//  Created by LiHongYu on 2016/11/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyTopView.h"

@implementation HyNearbyTopView

static int n = 4;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *titleArray = [NSArray array];
        titleArray = @[@"附近的人",@"附近的事",@"我的圈",@"更多圈",@"nil"];
        
        for (int i = 0; i<n; i++) {
            UIButton *customButton = [[UIButton alloc]init];
            customButton.titleLabel.font = [UIFont systemFontOfSize:15];
            [customButton setTitle:titleArray[i] forState:UIControlStateNormal];
            [customButton setTitle:titleArray[i] forState:UIControlStateSelected];
            [customButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [customButton setTitleColor:HyColor(87, 190, 174) forState:UIControlStateSelected];
            customButton.adjustsImageWhenHighlighted = NO;
            customButton.tag = i;
            
            switch (customButton.tag) {
                case 0:
                    self.personButton = customButton;
                    [self addSubview:customButton];
                    break;
                case 1:
                    self.thingButton = customButton;
                    [self addSubview:customButton];
                    break;
                case 2:
                    self.mineButton = customButton;
                    [self addSubview:customButton];
                    break;
                case 3:
                    self.moreButton = customButton;
                    [self addSubview:customButton];
                    break;
                default:
                    break;
            }
            
        }
        
        

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.personButton.frame = CGRectMake(0, 0, self.frame.size.width/n, self.frame.size.height);
    self.thingButton.frame = CGRectMake(self.frame.size.width/n, 0, self.frame.size.width/n, self.frame.size.height);
    self.mineButton.frame = CGRectMake(self.frame.size.width*2/n, 0, self.frame.size.width/n, self.frame.size.height);
    self.moreButton.frame = CGRectMake(self.frame.size.width*3/n, 0, self.frame.size.width/n, self.frame.size.height);
    
    [self.personButton addTarget:self action:@selector(personButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.thingButton addTarget:self action:@selector(thingButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.mineButton addTarget:self action:@selector(mineButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.moreButton addTarget:self action:@selector(moreButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)personButtonOnclick{
    self.personButton.selected = YES;
    self.thingButton.selected = NO;
    self.mineButton.selected = NO;
    self.moreButton.selected = NO;
}
-(void)thingButtonOnclick{
    self.personButton.selected = NO;
    self.thingButton.selected = YES;
    self.mineButton.selected = NO;
    self.moreButton.selected = NO;
    
}
-(void)mineButtonOnclick{
    self.personButton.selected = NO;
    self.thingButton.selected = NO;
    self.mineButton.selected = YES;
    self.moreButton.selected = NO;
}
-(void)moreButtonOnclick{
    self.personButton.selected = NO;
    self.thingButton.selected = NO;
    self.mineButton.selected = NO;
    self.moreButton.selected = YES;
}

@end
