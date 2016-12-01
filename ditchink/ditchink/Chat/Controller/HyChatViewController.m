//
//  HyChatViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/1.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyChatViewController.h"

@interface HyChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *ChatTableView;
@end

@implementation HyChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupTableView];
}

-(void)setNav{
    self.title=[NSString stringWithFormat:@"%@", self.titleNameStr];
    
    UIButton *scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [scanBtn setImage:[UIImage imageNamed:@"icon-person"] forState:UIControlStateNormal];
    [scanBtn addTarget:self action:@selector(NavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:scanBtn];
}

-(void)setupTableView{
    UITableView *ChatTableView = [[UITableView alloc]init];
    ChatTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    ChatTableView.backgroundColor = HyColor(239, 239, 239);
    ChatTableView.separatorStyle = NO;
    ChatTableView.delegate = self;
    ChatTableView.dataSource = self;
    ChatTableView.allowsSelection = NO;
    ChatTableView.bounces = NO;
    [self.view addSubview:ChatTableView];
    self.ChatTableView = ChatTableView;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

-(void)NavRightBtn{
    NSLog(@"NavRightBtn");
}

@end
