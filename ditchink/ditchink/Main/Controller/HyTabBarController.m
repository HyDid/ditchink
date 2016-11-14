//
//  HyTabBarController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyTabBarController.h"
#import "HyTabBar.h"
#import "HyNavigationController.h"

//three Main's Controller
#import "HyHomeViewController.h"
#import "HyMessageViewController.h"
#import "HyMeViewController.h"



@interface HyTabBarController ()<HyTabBarDelegate>
@property (weak, nonatomic) HyTabBar *customTabBar;


@end

@implementation HyTabBarController




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar removeFromSuperview];
    // 移除之前的4个UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) { //UITabBarButton
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化tabbar
    [self setupTabBar];
    
    // 2.初始化子控制器
    [self setupChildViewControllers];
    





}

- (void)setupTabBar
{
    HyTabBar *customTabBar = [[HyTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    
}

- (void)setupChildViewControllers
{

    HyMessageViewController *Message = [[HyMessageViewController alloc] init];
    [self setupChildViewController:Message title:@"消息" imageName:@"icon-news" selectedImageName:@"icon-news-click"];
    HyHomeViewController *home = [[HyHomeViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"icon-home" selectedImageName:@"icon-home-click"];
    HyMeViewController *Me = [[HyMeViewController alloc] init];
    [self setupChildViewController:Me title:@"附近" imageName:@"icon-neighbor" selectedImageName:@"icon-neighbor-click"];
    
//    self.selectedViewController = self.tabBarController.viewControllers[1];
    


}
- (void)tabBar:(HyTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;


}

/**
 *  添加一个子控制器
 *
 *  @param vc                子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中的图片
 */
- (void)setupChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置数据
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    // 2.包装
    HyNavigationController *nav = [[HyNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    // 3.添加按钮
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}


@end
