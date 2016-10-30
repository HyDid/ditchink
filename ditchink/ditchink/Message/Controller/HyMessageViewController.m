//
//  HyMessageViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyMessageViewController.h"
#import "HyTitleButtonView.h"

@interface HyMessageViewController ()

@property (nonatomic,strong)HyTitleButtonView *titleButtonView;
@property (nonatomic,strong)UITableView *messageTableview;
@property (nonatomic,strong)UITableView *systemTableview;
@end

@implementation HyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //设置导航栏
    [self setupNav];
    
    UITableView *systemTableview = [[UITableView alloc]init];
    systemTableview.frame = self.view.frame;
    systemTableview.backgroundColor = [UIColor blueColor];
    [self.view addSubview:systemTableview];
    UITableView *messagetableview = [[UITableView alloc]init];
    messagetableview.frame = self.view.frame;
    messagetableview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:messagetableview];
    self.systemTableview = systemTableview;
    self.messageTableview = messagetableview;

    

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.titleButtonView.messageButton.selected = YES;
}

-(void)setupNav{
    
    UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my-click"] forState:UIControlStateHighlighted];
    [titleBtn addTarget:self action:@selector(NavLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:titleBtn];
    

    HyTitleButtonView *titleButtonView = [[HyTitleButtonView alloc]init];
    titleButtonView.frame = CGRectMake(0, 0, 160, 30);
    titleButtonView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleButtonView;
    
    self.titleButtonView = titleButtonView;
    [self.titleButtonView.messageButton addTarget:self action:@selector(messageButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleButtonView.systemButton addTarget:self action:@selector(systemButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    
}

//导航栏左侧按钮
-(void)NavLeftBtn{
    NSLog(@"left");
}

-(void)messageButtonOnclick{
    self.titleButtonView.messageButton.selected = YES;
    self.titleButtonView.systemButton.selected = NO;
    self.messageTableview.hidden = NO;
    self.systemTableview.hidden = YES;
    
}
-(void)systemButtonOnclick{
    self.titleButtonView.messageButton.selected = NO;
    self.titleButtonView.systemButton.selected = YES;
    self.messageTableview.hidden = YES;
    self.systemTableview.hidden = NO;
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
