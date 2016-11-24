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
#import "HySystemViewTableViewCell.h"

#import "HySearchBar.h"

#import "MJRefresh.h"

#import "HySweepViewController.h"

@interface HyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)HyTitleButtonView *titleButtonView;
@property (nonatomic,strong)HySearchBar *SearchBar;
@property (nonatomic,strong)UITableView *messageTableview;
@property (nonatomic,strong)UITableView *systemTableview;

@property (nonatomic,copy)NSMutableArray *messageArray;
//@property (nonatomic,copy)NSMutableArray *systemArray;
@property (nonatomic,copy)NSMutableArray *systemCellFramesArray;
@end

@implementation HyMessageViewController

-(NSMutableArray *)messageArray{
    if (_messageArray == nil) {
        _messageArray = [NSMutableArray array];
    }
    return _messageArray;
}
//-(NSMutableArray *)systemArray{
//    if (_systemArray == nil) {
//    _systemArray = [NSMutableArray array];
//    }
//    return _systemArray;
//}
-(NSMutableArray *)systemCellFramesArray{
    if (_systemCellFramesArray == nil) {
        _systemCellFramesArray = [NSMutableArray array];
    }
    return _systemCellFramesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNav];
    //设置tableView
    [self setupTableView];
    //加载数据
    [self setupHttp];
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.SearchBar resignFirstResponder];
//}

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
-(void)setupTableView{
    UITableView *systemTableview = [[UITableView alloc]init];
    systemTableview.frame = self.view.frame;
    systemTableview.backgroundColor = HyColor(239, 239, 239);
    systemTableview.separatorStyle = NO;
    systemTableview.delegate = self;
    systemTableview.dataSource = self;
    systemTableview.allowsSelection = NO;
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
-(void)setupHttp{
    

    self.messageTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.systemTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    
    [self.messageTableview.mj_header beginRefreshing];
    [self.systemTableview.mj_header beginRefreshing];
}
-(void)loadNewData{

    
    
    [self messagePlistGet];
    [self systemPlistGet];
    [self.messageTableview.mj_header endRefreshing];
    [self.systemTableview.mj_header endRefreshing];
}

//从plist文件中获取数据
-(void)messagePlistGet{
    [self.messageArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Message_message.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in dictArray) {
        
        HyMessageModel *model = [HyMessageModel ModelWithDict:dict];
        [self.messageArray addObject:model];
    }
    [self.messageTableview reloadData];
}
-(void)systemPlistGet{
    [self.systemCellFramesArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Message_system.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *keyValues in dictArray) {
        
        HySystemModel *model = [HySystemModel ModelWithDict:keyValues];
        HySystemCellFrame *SystemCellFrame = [[HySystemCellFrame alloc]init];
        SystemCellFrame.SystemModel = model;
        [self.systemCellFramesArray addObject:SystemCellFrame];
        
    }

    [self.systemTableview reloadData];
}

//导航栏按钮
-(void)NavLeftBtn{
    NSLog(@"left");
}
-(void)messageButtonOnclick{
    self.messageTableview.hidden = NO;
    self.systemTableview.hidden = YES;
}
-(void)systemButtonOnclick{
    self.messageTableview.hidden = YES;
    self.systemTableview.hidden = NO;
}

//搜索栏
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *messageSeachView = [[UIView alloc]init];
    messageSeachView.backgroundColor = [UIColor whiteColor];
    HySearchBar *SearchBar = [[HySearchBar alloc]init];
    SearchBar.frame = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-20, 25);
    SearchBar.background = [UIImage imageNamed:@"icon-searchbackgroundlightgray"];
    SearchBar.contentMode = UIViewContentModeCenter;
    [messageSeachView addSubview:SearchBar];
    self.SearchBar = SearchBar;
    
    return messageSeachView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.messageTableview]) {
        return 70;
    }else if([tableView isEqual:self.systemTableview]){

        HySystemCellFrame *SystemCellFrame = self.systemCellFramesArray[indexPath.row];
        return SystemCellFrame.cellHeight;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.messageTableview]) {
//        return 3;
        return self.messageArray.count;
    }else if([tableView isEqual:self.systemTableview]){
//        return 2;
        return self.systemCellFramesArray.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if ([tableView isEqual:self.messageTableview]) {
        HyMessageTableViewCell *cell = [HyMessageTableViewCell cellWithTableView:self.messageTableview];
        cell.messageModel = self.messageArray[indexPath.row];
        return cell;
    }else if([tableView isEqual:self.systemTableview]){
        HySystemViewTableViewCell *cell = [HySystemViewTableViewCell cellWithTableView:self.systemTableview];
        cell.SystemCellFrame = self.systemCellFramesArray[indexPath.row];
        return cell;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([tableView isEqual:self.messageTableview]) {

        
    }else if([tableView isEqual:self.systemTableview]){

    }
}


@end
