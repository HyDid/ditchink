//
//  HyHomeViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHomeViewController.h"

#import "HyTitleBtn.h"
#import "HyScanBtn.h"


@interface HyHomeViewController ()

@end

@implementation HyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNav];
    
}





























-(void)setupNav{
    
    HyTitleBtn *titleBtn = [[HyTitleBtn alloc]init];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my-click"] forState:UIControlStateHighlighted];
    [titleBtn addTarget:self action:@selector(NavLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:titleBtn];

    HyScanBtn *scanBtn = [[HyScanBtn alloc]init];
    [scanBtn setImage:[UIImage imageNamed:@"icon-scan"] forState:UIControlStateNormal];
    [scanBtn setImage:[UIImage imageNamed:@"icon-scan-click"] forState:UIControlStateHighlighted];
    [scanBtn addTarget:self action:@selector(NavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:scanBtn];
    
}

//导航栏左侧按钮
-(void)NavLeftBtn{
    NSLog(@"left");
}
//导航栏右侧按钮
-(void)NavRightBtn{
    NSLog(@"right");
}



@end
