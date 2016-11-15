//
//  HyMeViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyMeViewController.h"
#import "HyNearbyTopView.h"

@interface HyMeViewController ()

@property(nonatomic,strong)HyNearbyTopView *topView;

@end

@implementation HyMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupNav];
    self.topView.personButton.selected = YES;
}
-(void)setupNav{
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightBtn setTitle:@"发表" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];

    [rightBtn addTarget:self action:@selector(NavrightBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    HyNearbyTopView *topView = [[HyNearbyTopView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_WIDTH/10)];
    topView.backgroundColor = HyColor(239, 239, 239);
    [topView.personButton addTarget:self action:@selector(personButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [topView.thingButton addTarget:self action:@selector(thingButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [topView.mineButton addTarget:self action:@selector(mineButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [topView.moreButton addTarget:self action:@selector(moreButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    self.topView = topView;
    [self.view addSubview:topView];
    
}
-(void)NavrightBtn{
    NSLog(@"发表");
}

-(void)personButtonOnclick{
    NSLog(@"personButtonOnclick");
}
-(void)thingButtonOnclick{
    NSLog(@"thingButtonOnclick");

}
-(void)mineButtonOnclick{
    NSLog(@"thingButtonOnclick");
}
-(void)moreButtonOnclick{
    NSLog(@"thingButtonOnclick");
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
