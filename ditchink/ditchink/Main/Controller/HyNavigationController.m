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
    
//    // 2.设置导航栏按钮的主题
//    [self setupBarButtonTheme];
}
//+ (void)setupBarButtonTheme
//{
//    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
//    
//    //设置按钮的背景
//
//        [barItem setBackgroundImage:[UIImage imageNamed:@"icon-top"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        [barItem setBackgroundImage:[UIImage imageNamed:@"icon-top"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//        [barItem setBackgroundImage:[UIImage imageNamed:@"icon-top"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
//
//    
//}

+ (void)setupNavBarTheme
{


    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    [navBar setBarTintColor:HyColor(88, 194, 174)];
    
    [navBar setTranslucent:NO];
//    [navBar setBackgroundColor:HyColor(87, 190, 174)];
    
    // 3.设置文字样式
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica" size:15];
    [navBar setTitleTextAttributes:attrs];

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

}



- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
