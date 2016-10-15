//
//  HyNavigationController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNavigationController.h"

@interface HyNavigationController ()

@end

@implementation HyNavigationController

+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮的主题
    [self setupBarButtonTheme];
}
+ (void)setupBarButtonTheme
{
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 1.设置按钮的背景

        [barItem setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    
}

+ (void)setupNavBarTheme
{
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor;

//    self.interactivePopGestureRecognizer.delegate = nil;
    
}

@end
