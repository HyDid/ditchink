//
//  HyBookViewController.m
//  ditchink
//
//  Created by LiHongYu on 2017/5/24.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import "HyBookViewController.h"

@interface HyBookViewController ()

@end

@implementation HyBookViewController

static int totalColumns = 3;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HyColor(239, 239, 239);
    
    CGFloat ConverW = 80;
    CGFloat ConverH = 120;
    CGFloat marginX = (SCREEN_WIDTH - totalColumns * ConverW) / (totalColumns + 1);
    CGFloat marginY = 30;
    for (int index = 0; index<7; index++) {
        UIImageView *aView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon-pic%i",index]]];
        int row = index / totalColumns;
        int col = index % totalColumns;
        
        CGFloat appX = marginX + col * (ConverW + marginX);
        CGFloat appY = marginY + row * (ConverH + marginY);
        aView.frame = CGRectMake(appX, appY, ConverW, ConverH);
        
        [self.view addSubview:aView];
    }
    
    for (int index = 0; index<3; index++) {
        UIImageView *iView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-base2"]];
        
        iView.bounds = CGRectMake(0, 0, SCREEN_WIDTH - 20, 10);
        iView.center = CGPointMake(SCREEN_WIDTH/2, marginY/2 + (index + 1) *(ConverH + marginY));
        
        [self.view addSubview:iView];
    }
    
    
    
}

@end
