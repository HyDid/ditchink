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
#import "HySearchBar.h"


@interface HyHomeViewController ()
@property(nonatomic,strong) HySearchBar *bar;

@end

@implementation HyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNav];
    
}





























-(void)setupNav{
    
    UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my-click"] forState:UIControlStateHighlighted];
    [titleBtn addTarget:self action:@selector(NavLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:titleBtn];

    UIButton *scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [scanBtn setImage:[UIImage imageNamed:@"icon-scan"] forState:UIControlStateNormal];
    [scanBtn setImage:[UIImage imageNamed:@"icon-scan-click"] forState:UIControlStateHighlighted];
    [scanBtn addTarget:self action:@selector(NavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:scanBtn];
    
    HySearchBar *bar = [[HySearchBar alloc]init];
    bar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -100, 25);
    bar.contentMode = UIViewContentModeCenter;
    self.navigationItem.titleView = bar;
    self.bar = bar;
    
    
}

//导航栏左侧按钮
-(void)NavLeftBtn{
    NSLog(@"left");
}
//导航栏右侧按钮
-(void)NavRightBtn{
    NSLog(@"right");
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.bar resignFirstResponder];
}



@end
