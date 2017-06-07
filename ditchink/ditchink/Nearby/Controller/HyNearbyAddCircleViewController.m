//
//  HyNearbyAddCircleViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/1.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyNearbyAddCircleViewController.h"
#import "MJRefresh.h"

#import "HyNearbyCircleTableViewCell.h"
#import "HynearCircleDarentangTableViewCell.h"
#import "HyNearCircleZhidingTableViewCell.h"
#import "HyNearCircleTalkTableViewCell.h"

@interface HyNearbyAddCircleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *AddCircleTableView;
@property(nonatomic,copy)NSMutableArray *talkArray;
@end

@implementation HyNearbyAddCircleViewController

-(NSMutableArray *)talkArray{
    if (_talkArray == nil) {
        _talkArray = [NSMutableArray array];
    }
    return _talkArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupTableView];
    //加载数据
    [self setupHttp];
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
//    AddCircleTableView.allowsSelection = NO;
//    AddCircleTableView.bounces = NO;
    [self.view addSubview:AddCircleTableView];
    self.AddCircleTableView = AddCircleTableView;

}
-(void)setupHttp{
    
    
    self.AddCircleTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    [self.AddCircleTableView.mj_header beginRefreshing];
    
}
-(void)loadNewData{
    [self NearbyCircleTalkPlistGet];

    [self.AddCircleTableView.mj_header endRefreshing];
    
}

-(void)NearbyCircleTalkPlistGet{
    [self.talkArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nearby_circleAddTalk.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in dictArray) {
        HyNearbyCircleTalkModel *model = [HyNearbyCircleTalkModel ModelWithDict:dict];
        [self.talkArray addObject:model];
    }
    
    [self.AddCircleTableView reloadData];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headDarkVIew = [[UIView alloc]init];
    headDarkVIew.backgroundColor = HyColor(239, 239, 239);
    return headDarkVIew;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 8;
            break;
        case 3:
            return 8;
            break;
        default:
            break;
    }
    return 0;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 70;
            break;
        case 1:
            return 40;
            break;
        case 2:
            return 45;
            break;
        case 3:
            return 65;
            break;
        default:
            break;
    }

    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return self.talkArray.count;
            break;
        default:
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (indexPath.section == 0) {
        static NSString *ID = @"NearbyCircleTableViewCell";
        HyNearbyCircleTableViewCell *NearbyCircleTableViewCell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!NearbyCircleTableViewCell) {
            NearbyCircleTableViewCell = [HyNearbyCircleTableViewCell cellWithTableView:self.AddCircleTableView];
        }
        [NearbyCircleTableViewCell.marryLab removeFromSuperview];
        NearbyCircleTableViewCell.CircleModel = self.CircleModel;
        return NearbyCircleTableViewCell;
    }else if (indexPath.section == 1){
        static NSString *ID = @"NearCircleDarentangTableViewCell";
        HynearCircleDarentangTableViewCell *NearCircleDarentangTableViewCell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!NearCircleDarentangTableViewCell) {
            NearCircleDarentangTableViewCell = [HynearCircleDarentangTableViewCell cellWithTableView:self.AddCircleTableView];
        }
        return NearCircleDarentangTableViewCell;
    }else if (indexPath.section == 2){
        static NSString *ID = @"NearCircleZhidingTableViewCell";
        HyNearCircleZhidingTableViewCell *NearCircleZhidingTableViewCell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!NearCircleZhidingTableViewCell) {
            NearCircleZhidingTableViewCell = [HyNearCircleZhidingTableViewCell cellWithTableView:self.AddCircleTableView];
        }
        return NearCircleZhidingTableViewCell;
    }else if (indexPath.section == 3){
        static NSString *ID = @"NearCircleTalkTableViewCell";
        HyNearCircleTalkTableViewCell *NearCircleTalkTableViewCell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!NearCircleTalkTableViewCell) {
            NearCircleTalkTableViewCell = [HyNearCircleTalkTableViewCell cellWithTableView:self.AddCircleTableView];
        }
        NearCircleTalkTableViewCell.TalkModel = self.talkArray[indexPath.row];
        return NearCircleTalkTableViewCell;
        
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
}
@end
