//
//  HyChatViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/1.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyChatViewController.h"
#import "addTextView.h"

@interface HyChatViewController ()<UITableViewDelegate,UITableViewDataSource,addTextViewDelegate>
@property(nonatomic,strong)UITableView *ChatTableView;
@property(nonatomic,strong)addTextView *editTextView;
@end

@implementation HyChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupTableView];
    [self setupEditTextView];

    
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

-(void)setupEditTextView{
    addTextView *editTextView = [[addTextView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-65-40, SCREEN_WIDTH, 40)];
    
    editTextView.delegate = self;
    
    self.editTextView = editTextView;
    [self.view addSubview:self.editTextView];
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
/**
 *  当开始拖拽表格的时候就会调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 退出键盘
    [self.view endEditing:YES];
}


-(void)EditTextView:(UITextField *)textField{
    NSLog(@"+++++++%@",textField.text);
}

-(void)soundBtnOnclick:(UIButton *)Btn{
    NSLog(@"sound");
}

@end
