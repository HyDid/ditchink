//
//  HyHomeViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHomeViewController.h"
#import "HySearchBar.h"
#import "HyHomeModel.h"
#import "HyCustomCell.h"

@interface HyHomeViewController () <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) HySearchBar *bar;
@property(nonatomic,strong) NSArray *cells;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupNav];
    
    self.tableView.rowHeight = 61;
}

// 懒加载
- (NSArray *)cells {
    if (_cells == nil) {
        // 初始化
        // 获取plist全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"home.plist" ofType:nil];
        // 加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        // 将dictArray里面的所有字典转成模型，放入新数组
        NSMutableArray *tempArray = [NSMutableArray array]; // 临时数组
        for (NSDictionary *dict in dictArray) {
            // 创建模型对象
            HyHomeModel *model = [HyHomeModel HyWithDict:dict];
            // 添加模型对象到数组中
            [tempArray addObject:model];
        }
        // 赋值
        _cells = tempArray;
    }
    return _cells;
}

#pragma mark 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // 行数
    return self.cells.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { // 设置cell
    // 1.创建cell
    HyCustomCell *cell = [HyCustomCell cellWithTableView:tableView];
    // 2.给cell传递模型
    cell.model = self.cells[indexPath.row];
    
    return cell;
}

















-(void)setupNav{
    
    UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"icon-my-click"] forState:UIControlStateHighlighted];
    [titleBtn addTarget:self action:@selector(NavLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:titleBtn];

    UIButton *scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [scanBtn setImage:[UIImage imageNamed:@"icon-scan"] forState:UIControlStateNormal];
    [scanBtn setImage:[UIImage imageNamed:@"icon-scan-click"] forState:UIControlStateHighlighted];
    [scanBtn addTarget:self action:@selector(NavRightBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:scanBtn];
    
    HySearchBar *bar = [[HySearchBar alloc]init];
    bar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -100, 25);
    bar.contentMode = UIViewContentModeCenter;
    self.navigationItem.titleView = bar;
    self.bar = bar;
    
    
}

//导航栏左侧按钮
-(void)NavLeftBtn{
    NSLog(@"left");
}
//导航栏右侧按钮
-(void)NavRightBtn{
    NSLog(@"right");
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.bar resignFirstResponder];
}

@end
