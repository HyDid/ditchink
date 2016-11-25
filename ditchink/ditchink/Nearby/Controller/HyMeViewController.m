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

#import "MJRefresh.h"

@interface HyMeViewController ()<UITableViewDelegate,UITableViewDataSource,HyNearbyTopViewDelegate>

@property(nonatomic,copy)NSMutableArray *NearPersonDetailArray;
@property(nonatomic, strong)NSMutableArray *NearThingFramesArray;
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.selectedBtnTag ==0) {
        return self.NearPersonDetailArray.count;
//        return 3;
    }else if (self.selectedBtnTag ==1){
        return self.NearThingFramesArray.count;
 //       return 1;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedBtnTag ==0) {
        return 140;
    }else if (self.selectedBtnTag ==1){
        HyNearbyThingcellFrame * NearbyThingcellFrame = self.NearThingFramesArray[indexPath.row];

        return NearbyThingcellFrame.cellHeight;
//       return 70;
    }
    
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (self.selectedBtnTag == 0) {
        HyNearbyPersonTableViewCell *cell = [HyNearbyPersonTableViewCell cellWithTableView:tableView];
        cell.NearbyPersonModel = self.NearPersonDetailArray[indexPath.row];;
            return  cell;
    }else if (self.selectedBtnTag == 1){
        HyNearByThingTableViewCell *cell = [HyNearByThingTableViewCell cellWithTableView:tableView];
        cell.NearbyThingcellFrame = self.NearThingFramesArray[indexPath.row];
        return  cell;
    }else if (self.selectedBtnTag == 2){
        
    }else if (self.selectedBtnTag == 3){
        
    }else{
        
    }
    
    return  cell;
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
