//
//  HyTitleButtonView.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/30.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyTitleButtonView.h"



@implementation HyTitleButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIButton *messageButton = [[UIButton alloc]init];
        messageButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [messageButton setTitle:@"消息" forState:UIControlStateNormal];
        [messageButton setTitle:@"消息" forState:UIControlStateSelected];
        [messageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [messageButton setTitleColor:HyColor(87, 190, 174) forState:UIControlStateSelected];
        [messageButton setBackgroundImage:[UIImage imageNamed:@"icon-left"] forState:UIControlStateNormal];
        [messageButton setBackgroundImage:[UIImage imageNamed:@"icon-leftpress"] forState:UIControlStateSelected];
        messageButton.adjustsImageWhenHighlighted = NO;
        
        //设置默认
        messageButton.selected = YES;
        
        [self addSubview:messageButton];
        self.messageButton = messageButton;
        
        
        UIButton *systemButton = [[UIButton alloc]init];
        systemButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [systemButton setTitle:@"系统" forState:UIControlStateNormal];
        [systemButton setTitle:@"系统" forState:UIControlStateSelected];
        [systemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [systemButton setTitleColor:HyColor(87, 190, 174) forState:UIControlStateSelected];
        [systemButton setBackgroundImage:[UIImage imageNamed:@"icon-right"] forState:UIControlStateNormal];
        [systemButton setBackgroundImage:[UIImage imageNamed:@"icon-rightpress"] forState:UIControlStateSelected];
        systemButton.adjustsImageWhenHighlighted = NO;
        
        [self addSubview:systemButton];
        self.systemButton = systemButton;
        
        
        [self.messageButton addTarget:self action:@selector(messageButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
        [self.systemButton addTarget:self action:@selector(systemButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
        

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.messageButton.frame = CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height);
    self.systemButton.frame = CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height);
    
}

-(void)messageButtonOnclick{
    self.messageButton.selected = YES;
    self.systemButton.selected = NO;

}
-(void)systemButtonOnclick{
    self.messageButton.selected = NO;
    self.systemButton.selected = YES;

}





@end
