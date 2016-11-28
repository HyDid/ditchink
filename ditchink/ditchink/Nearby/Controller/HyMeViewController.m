//
//  HyMeViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyMeViewController.h"
#import "HyNearbyTopView.h"

#import "HyNearbyPersonTableViewCell.h"
#import "HyNearByThingTableViewCell.h"
#import "HyNearbyThingcellFrame.h"
#import "HyNearbyCircleTableViewCell.h"
#import "HyNearbyCircleAddTableViewCell.h"

#import "MJRefresh.h"

@interface HyMeViewController ()<UITableViewDelegate,UITableViewDataSource,HyNearbyTopViewDelegate>

@property(nonatomic,copy)NSMutableArray *NearPersonDetailArray;
@property(nonatomic, strong)NSMutableArray *NearThingFramesArray;
@property(nonatomic, strong)NSMutableArray *NearCircleArray;
@property(nonatomic, strong)NSMutableArray *NearCircleMeArray;
@property(nonatomic,strong)HyNearbyTopView *topView;
@property(nonatomic,strong)UITableView *nearbyPersonTableView;
@property(nonatomic,assign)int selectedBtnTag;

@end

@implementation HyMeViewController

-(NSMutableArray *)NearPersonDetailArray{
    if (_NearPersonDetailArray == nil) {
        _NearPersonDetailArray = [NSMutableArray array];
    }
    return _NearPersonDetailArray;
}
- (NSMutableArray *)NearThingFramesArray
{
    if (_NearThingFramesArray == nil) {
        _NearThingFramesArray = [NSMutableArray array];
    }
    return _NearThingFramesArray;
}
- (NSMutableArray *)NearCircleArray
{
    if (_NearCircleArray == nil) {
        _NearCircleArray = [NSMutableArray array];
    }
    return _NearCircleArray;
}
- (NSMutableArray *)NearCircleMeArray
{
    if (_NearCircleMeArray == nil) {
        _NearCircleMeArray = [NSMutableArray array];
    }
    return _NearCircleMeArray;
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
-(void)setupNav{
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightBtn setTitle:@"发表" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];

    [rightBtn addTarget:self action:@selector(NavrightBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    //设置导航栏下四个按钮
    HyNearbyTopView *topView = [[HyNearbyTopView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_WIDTH/10)];
    topView.backgroundColor = HyColor(239, 239, 239);
    topView.delegate = self;
    self.topView = topView;
    [self.view addSubview:topView];
    
}

-(void)setupTableView{
    UITableView *nearbyPersonTableView = [[UITableView alloc]init];
    nearbyPersonTableView.frame = CGRectMake(0, SCREEN_WIDTH/10, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_WIDTH/10);
    nearbyPersonTableView.backgroundColor = HyColor(239, 239, 239);
    nearbyPersonTableView.separatorStyle = NO;
    nearbyPersonTableView.delegate = self;
    nearbyPersonTableView.dataSource = self;
    nearbyPersonTableView.allowsSelection = NO;
    [self.view addSubview:nearbyPersonTableView];

    
    self.nearbyPersonTableView = nearbyPersonTableView;

}

-(void)setupHttp{
    
    
    self.nearbyPersonTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    [self.nearbyPersonTableView.mj_header beginRefreshing];

}
-(void)loadNewData{
    [self NearbyPersonPlistGet];
    [self NearbyThingPlistGet];
    [self NearbyCirclePlistGet];
    [self NearbyCircleMePlistGet];
    [self.nearbyPersonTableView.mj_header endRefreshing];

}
-(void)NearbyPersonPlistGet{
    [self.NearPersonDetailArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nearby_person.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in dictArray) {
        HyNearbyPersonModel *model = [HyNearbyPersonModel ModelWithDict:dict];
        [self.NearPersonDetailArray addObject:model];
    }
    
    [self.nearbyPersonTableView reloadData];
    
}
-(void)NearbyThingPlistGet{
    [self.NearThingFramesArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nearby_thing.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *keyValues in dictArray) {
        
        HyNearbyThingModel *model = [HyNearbyThingModel ModelWithDict:keyValues];
        HyNearbyThingcellFrame *NearbyThingcellFrame = [[HyNearbyThingcellFrame alloc]init];
        NearbyThingcellFrame.NearbyThingModel = model;
        [self.NearThingFramesArray addObject:NearbyThingcellFrame];
        
    }
    
    [self.nearbyPersonTableView reloadData];

}
-(void)NearbyCirclePlistGet{
    [self.NearCircleArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nearby_circle.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in dictArray) {
        HyNearbyCircleModel *model = [HyNearbyCircleModel ModelWithDict:dict];
        [self.NearCircleArray addObject:model];
    }
    
    [self.nearbyPersonTableView reloadData];

}
-(void)NearbyCircleMePlistGet{
    [self.NearCircleMeArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Nearby_circleMe.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in dictArray) {
        HyNearbyCircleModel *model = [HyNearbyCircleModel ModelWithDict:dict];
        [self.NearCircleMeArray addObject:model];
    }
    
    [self.nearbyPersonTableView reloadData];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     UIView *NearbyCircleView = [[UIView alloc]init];
    NearbyCircleView.backgroundColor = [UIColor whiteColor];
    
    UIView *lightDrayView = [[UIView alloc]init];
    lightDrayView.backgroundColor = HyColor(239, 239, 239);
    lightDrayView.frame = CGRectMake(10, 24, SCREEN_WIDTH - 10, 1);
    UIView *DrayView = [[UIView alloc]init];
    
    DrayView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    
    UILabel *CircleViewtitleLab = [[UILabel alloc]init];
    CircleViewtitleLab.font = [UIFont systemFontOfSize:12];
    CircleViewtitleLab.textColor = [UIColor lightGrayColor];
    CircleViewtitleLab.frame = CGRectMake(10, 5, 100, 20);
    
    if (self.selectedBtnTag == 2) {
        switch (section) {
            case 0:
                NearbyCircleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 140);
                NearbyCircleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon-picture3"]];
                lightDrayView.backgroundColor = [UIColor clearColor];
                break;
            case 1:
                CircleViewtitleLab.text = @"我的所属圈";

                break;
            case 2:

                break;
            case 3:
                CircleViewtitleLab.text = @"兴趣推荐圈";
                CircleViewtitleLab.frame = CGRectMake(10, 25, 100, 20);
                lightDrayView.frame = CGRectMake(10, 44, SCREEN_WIDTH - 10, 1);
                DrayView.backgroundColor = HyColor(239, 239, 239);

                break;
                
            default:
                break;
        }

    }
    
    [NearbyCircleView addSubview:CircleViewtitleLab];
    [NearbyCircleView addSubview:lightDrayView];
    [NearbyCircleView addSubview:DrayView];
    return NearbyCircleView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.selectedBtnTag == 2) {
        switch (section) {
            case 0:
                return 135;
                break;
            case 1:
                return 25;
                break;
            case 2:
                return 0;
                break;
            case 3:
                return 45;
                break;
                
            default:
                break;
        }
        
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.selectedBtnTag ==0) {
        return 1;
    }else if (self.selectedBtnTag ==1){
        return 1;
    }else if (self.selectedBtnTag == 2){
        return 4;
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.selectedBtnTag ==0) {
        return self.NearPersonDetailArray.count;
    }else if (self.selectedBtnTag ==1){
        return self.NearThingFramesArray.count;
    }else if (self.selectedBtnTag == 2){
        switch (section) {
            case 0:
               return 0;
                break;
            case 1:
                return self.NearCircleMeArray.count;
                break;
            case 2:
                return 1;
                break;
            case 3:
                return self.NearCircleArray.count;
                break;
                
            default:
                break;
        }
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedBtnTag ==0) {
        return 140;
    }else if (self.selectedBtnTag ==1){
        HyNearbyThingcellFrame * NearbyThingcellFrame = self.NearThingFramesArray[indexPath.row];
        return NearbyThingcellFrame.cellHeight;
    }else if (self.selectedBtnTag ==2){

        if (indexPath.section == 2) {
            return 50;
        }else{
            return 40;
        }
        
    }
    
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (self.selectedBtnTag == 0) {
        [self.nearbyPersonTableView setAllowsSelection:NO];
        HyNearbyPersonTableViewCell *cell = [HyNearbyPersonTableViewCell cellWithTableView:tableView];
        cell.NearbyPersonModel = self.NearPersonDetailArray[indexPath.row];
            return  cell;
    }else if (self.selectedBtnTag == 1){
        [self.nearbyPersonTableView setAllowsSelection:NO];
        HyNearByThingTableViewCell *cell = [HyNearByThingTableViewCell cellWithTableView:tableView];
        cell.NearbyThingcellFrame = self.NearThingFramesArray[indexPath.row];
        return  cell;
    }else if (self.selectedBtnTag == 2){
        [self.nearbyPersonTableView setAllowsSelection:YES];
        if (indexPath.section == 1) {
            HyNearbyCircleTableViewCell *cell = [HyNearbyCircleTableViewCell cellWithTableView:tableView];
            [cell.CircleAddBtn removeFromSuperview];
            cell.CircleModel = self.NearCircleMeArray[indexPath.row];
            return  cell;
        }else if (indexPath.section == 2){
            HyNearbyCircleAddTableViewCell *cell = [HyNearbyCircleAddTableViewCell cellWithTableView:tableView];
            return  cell;

        }else if (indexPath.section == 3) {
            HyNearbyCircleTableViewCell *cell = [HyNearbyCircleTableViewCell cellWithTableView:tableView];
            cell.CircleModel = self.NearCircleArray[indexPath.row];
            return  cell;
        }

        
        
    }else if (self.selectedBtnTag == 3){
        [self.nearbyPersonTableView setAllowsSelection:NO];
        
    }else{
        
    }
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectedBtnTag == 0) {
       
    }else if (self.selectedBtnTag == 1){
       
    }else if (self.selectedBtnTag == 2){

        
        if (indexPath.section == 1) {
           
        }else if (indexPath.section == 2){

            [self.topView.selectedButton setSelected:NO];
            self.topView.moreButton.selected = YES;
            [self.topView setSelectedButton:self.topView.moreButton];
            [self HyNearbyTopView:self.topView didSelectedButtonFrom:2 to:3];

        }else if (indexPath.section == 3) {
        
        }
        
        
    }else if (self.selectedBtnTag == 3){
        
    }else{
        
    }

}


-(void)NavrightBtn{
    NSLog(@"发表");
}

// delegate
- (void)HyNearbyTopView:(HyNearbyTopView *)NearbyTopView didSelectedButtonFrom:(int)from to:(int)to{
    self.selectedBtnTag = to;

    [self.nearbyPersonTableView reloadData];
}




@end
