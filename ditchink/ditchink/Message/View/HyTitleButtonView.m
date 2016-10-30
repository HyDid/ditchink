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
        [messageButton setTitle:@"消息" forState:UIControlStateNormal];
        [messageButton setTitle:@"消息" forState:UIControlStateSelected];
        
        [messageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [messageButton setTitleColor:HyColor(87, 190, 174) forState:UIControlStateSelected];
        
        [self addSubview:messageButton];
        self.messageButton = messageButton;
        
        
        UIButton *systemButton = [[UIButton alloc]init];
        [systemButton setTitle:@"系统" forState:UIControlStateNormal];
        [systemButton setTitle:@"系统" forState:UIControlStateSelected];
        [systemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [systemButton setTitleColor:HyColor(87, 190, 174) forState:UIControlStateSelected];
        [self addSubview:systemButton];
        self.systemButton = systemButton;
        
        

        

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.messageButton.frame = CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height);
    self.systemButton.frame = CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height);
    
}





@end
