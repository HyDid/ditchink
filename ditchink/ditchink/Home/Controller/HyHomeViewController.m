//
//  HyHomeViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHomeViewController.h"
#import "HySearchBar.h"
#import "HyHomeModel.h" // 4个cell的模型
#import "HyCustomCell.h" // 4个cell
#import "HyCusLifeCell.h" // 我的生活cell
#import "HyCusBtnCell.h" // 按钮cell
#import "headerImage.h" // 图片轮播

#import "HyLoginViewController.h"


@interface HyHomeViewController () <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) HySearchBar *bar;
@property(nonatomic,strong) NSArray *cells;
@property(nonatomic,strong) NSArray *btns;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation HyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupNav];
//    self.tableView.rowHeight = 61;


    
    self.tableView.sectionFooterHeight = 2.0;
    self.tableView.bounces = NO;
    
    //设置headerView （添加图片轮播）
    
    self.tableView.tableHeaderView = [headerImage headerImage];
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
//            HyHomeModel *model = [HyHomeModel HyWithDict:dict];
            HyHomeModel *model = [[HyHomeModel alloc] initWithDict:dict];
            // 添加模型对象到数组中
            [tempArray addObject:model];
        }
        // 赋值
        _cells = tempArray;
    }
    return _cells;
}

//- (NSArray *)btns {
//    if (_btns == nil) {
//        // 初始化
//        // 获取plist全路径
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"FourBtn.plist" ofType:nil];
//        // 加载数组
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
//        // 将dictArray里面的所有字典转成模型，放入新数组
//        NSMutableArray *tempArray = [NSMutableArray array]; // 临时数组
//        for (NSDictionary *dict in dictArray) {
//            // 创建模型对象
//            //            HyHomeModel *model = [HyHomeModel HyWithDict:dict];
//            HyFourBtnModel *model = [[HyFourBtnModel alloc] initWithDict:dict];
//            // 添加模型对象到数组中
//            [tempArray addObject:model];
//        }
//        // 赋值
//        _btns = tempArray;
//    }
//    return _btns;
//}

#pragma mark 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // 行数
    
    switch (section) {
        case 0:
            return 1; // section == 0，一行
            break;
        case 1 :
            return 1; // section == 1，一行
            break;
        case 2:
            return self.cells.count; // section == 2，四行
            break;
        default:
            break;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建cell
    static NSString *ID = @"cell1";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    switch (indexPath.section) { //哪一个分区
        case 0: // 第1个区
            switch (indexPath.row) {
                case 0: {
                    // 创建cell 设置数据
                    HyCusBtnCell *cell1 = [HyCusBtnCell cellWithTableView:tableView];
                    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell1;
                    break;
                }
            }break;
        case 1: // 第2个区
            switch (indexPath.row) {
                case 0:{
                    // 创建cell 设置数据
                    HyCusLifeCell *cell1 = [HyCusLifeCell cellWithTableView:tableView];
                    return cell1;
                    break;
                }
            }break;
        case 2:{ // 第3个区
            // 创建cell
            HyCustomCell *cell = [HyCustomCell cellWithTableView:tableView];
            // 设置数据
            [cell setModelll:self.cells[indexPath.row]];
            return cell;
            break;
        }
    }
    return cell1;
}

// 最上方的section距离顶部距离
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 13;
    }
    return 10;
}

// 设置section==0的高度（不同于其他）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }
    return 61;
}

// 点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"cell = %ld",(long)indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        NSLog(@"life cell = %ld",(long)indexPath.row);
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            NSLog(@"时讯科普 cell = %ld",(long)indexPath.row);
        } else if (indexPath.row == 1) {
            NSLog(@"育儿经验 cell = %ld",(long)indexPath.row);
        } else if (indexPath.row == 2) {
            NSLog(@"量身定制 cell = %ld",(long)indexPath.row);
        } else {
            NSLog(@"线下互动 cell = %ld",(long)indexPath.row);
        }
    }
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
    HyLoginViewController *LoginViewController = [[HyLoginViewController alloc]init];
    [self presentViewController:LoginViewController animated:YES completion:^{
        
    }];
}
//导航栏右侧按钮
-(void)NavRightBtn{
    NSLog(@"right");
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.bar resignFirstResponder];
}

@end
