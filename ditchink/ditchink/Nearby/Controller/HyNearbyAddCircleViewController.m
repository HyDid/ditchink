//
//  HyNearbyAddCircleViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/1.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyAddCircleViewController.h"

@interface HyNearbyAddCircleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *AddCircleTableView;
@end

@implementation HyNearbyAddCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupTableView];
    
}

-(void)setNav{
    self.title=[NSString stringWithFormat:@"附近"];
}
-(void)setupTableView{
    UITableView *AddCircleTableView = [[UITableView alloc]init];
    AddCircleTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    AddCircleTableView.backgroundColor = HyColor(239, 239, 239);
    AddCircleTableView.separatorStyle = NO;
    AddCircleTableView.delegate = self;
    AddCircleTableView.dataSource = self;
    AddCircleTableView.allowsSelection = NO;
    AddCircleTableView.bounces = NO;
    [self.view addSubview:AddCircleTableView];
    self.AddCircleTableView = AddCircleTableView;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}
@end
