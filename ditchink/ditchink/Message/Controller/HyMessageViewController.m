//
//  HyMessageViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyMessageViewController.h"
#import "HyTitleButtonView.h"
#import "HyMessageTableViewCell.h"

#import "HySearchBar.h"

@interface HyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

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
    systemTableview.backgroundColor = HyColor(239, 239, 239);
    systemTableview.separatorStyle = NO;
    systemTableview.delegate = self;
    systemTableview.dataSource = self;
    [self.view addSubview:systemTableview];
    
    
    UITableView *messagetableview = [[UITableView alloc]init];
    messagetableview.frame = self.view.frame;
    messagetableview.backgroundColor = HyColor(239, 239, 239);
    messagetableview.separatorStyle = NO;
    messagetableview.delegate = self;
    messagetableview.dataSource = self;
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
    titleButtonView.frame = CGRectMake(0, 0, 160, 25);
    self.navigationItem.titleView = titleButtonView;
    self.titleButtonView = titleButtonView;
    [self.titleButtonView.messageButton addTarget:self action:@selector(messageButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.titleButtonView.systemButton addTarget:self action:@selector(systemButtonOnclick) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    
}

//导航栏按钮
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



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.messageTableview]) {
        return 70;
    }else if([tableView isEqual:self.systemTableview]){
        return 100;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *messageSeachView = [[UIView alloc]init];
    messageSeachView.backgroundColor = [UIColor whiteColor];
    HySearchBar *bar = [[HySearchBar alloc]init];
    bar.frame = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-20, 25);
    bar.background = [UIImage imageNamed:@"icon-searchbackgroundlightgray"];
    bar.contentMode = UIViewContentModeCenter;
    [messageSeachView addSubview:bar];
    
    return messageSeachView;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.messageTableview]) {
        return 3;
    }else if([tableView isEqual:self.systemTableview]){
        return 4;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if ([tableView isEqual:self.messageTableview]) {
        HyMessageTableViewCell *cell = [HyMessageTableViewCell cellWithTableView:self.messageTableview];
        return cell;
    }else if([tableView isEqual:self.systemTableview]){
        return cell;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 
}


@end
