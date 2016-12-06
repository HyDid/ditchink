//
//  HyChatViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/1.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyChatViewController.h"

#import "MJMessage.h"
#import "MJMessageFrame.h"
#import "MJMessageCell.h"

#import "HyEditTextBarView.h"

@interface HyChatViewController ()<UITableViewDelegate,UITableViewDataSource,HyEditTextBarViewDelegate>
@property(nonatomic,strong)UITableView *ChatTableView;
@property(nonatomic,strong)HyEditTextBarView *editTextBarView;

@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (nonatomic, strong) NSDictionary *autoreply;
@end

@implementation HyChatViewController

- (NSDictionary *)autoreply
{
    if (_autoreply == nil) {
        _autoreply = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoreply.plist" ofType:nil]];
    }
    return _autoreply;
}

- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        
        NSMutableArray *mfArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            // 消息模型
            MJMessage *msg = [MJMessage messageWithDict:dict];
            
            // 取出上一个模型
            MJMessageFrame *lastMf = [mfArray lastObject];
            MJMessage *lastMsg = lastMf.message;
            
            // 判断两个消息的时间是否一致
            msg.hideTime = [msg.time isEqualToString:lastMsg.time];
            
            // frame模型
            MJMessageFrame *mf = [[MJMessageFrame alloc] init];
            mf.message = msg;
            
            // 添加模型
            [mfArray addObject:mf];
        }
        
        _messageFrames = mfArray;
    }
    return _messageFrames;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupTableView];
    [self setupeditTextBarView];

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
    
    ChatTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-65-40);
    ChatTableView.backgroundColor = HyColor(239, 239, 239);
    ChatTableView.separatorStyle = NO;
    ChatTableView.delegate = self;
    ChatTableView.dataSource = self;
    ChatTableView.allowsSelection = NO;
    ChatTableView.bounces = NO;
    ChatTableView.showsVerticalScrollIndicator = NO;

    [self.view addSubview:ChatTableView];
    self.ChatTableView = ChatTableView;
    
}

-(void)setupeditTextBarView{
    HyEditTextBarView *editTextBarView = [[HyEditTextBarView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-65-40, SCREEN_WIDTH, 40)];
    editTextBarView.delegate = self;
    self.editTextBarView = editTextBarView;
    [self.view addSubview:editTextBarView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJMessageFrame *mf = self.messageFrames[indexPath.row];
    return mf.cellHeight;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1.创建cell
    MJMessageCell *cell = [MJMessageCell cellWithTableView:tableView];
    
    // 2.给cell传递模型
    cell.messageFrame = self.messageFrames[indexPath.row];
    
    // 3.返回cell
    return cell;
}

-(void)NavRightBtn{
    NSLog(@"NavRightBtn");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}




-(void)textFieldReturn:(UITextField *)textField{
    
    // 1.自己发一条消息
    [self addMessage:textField.text type:MJMessageTypeMe];
    
    // 2.自动回复一条消息
    NSString *reply = [self replayWithText:textField.text];
    [self addMessage:reply type:MJMessageTypeOther];
}
/**
 *  发送一条消息
 */
- (void)addMessage:(NSString *)text type:(MJMessageType)type
{
    // 1.数据模型
    MJMessage *msg = [[MJMessage alloc] init];
    msg.type = type;
    msg.text = text;
    // 设置数据模型的时间
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    // NSDate  --->  NSString
    // NSString ---> NSDate
    //    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //  2014-08-09 15:45:56
    // 09/08/2014  15:45:56
    msg.time = [fmt stringFromDate:now];
    
    // 看是否需要隐藏时间
    MJMessageFrame *lastMf = [self.messageFrames lastObject];
    MJMessage *lastMsg = lastMf.message;
    msg.hideTime = [msg.time isEqualToString:lastMsg.time];
    
    // 2.frame模型
    MJMessageFrame *mf = [[MJMessageFrame alloc] init];
    mf.message = msg;
    [self.messageFrames addObject:mf];
    
    // 3.刷新表格
    [self.ChatTableView reloadData];
    
    // 4.自动滚动表格到最后一行
    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.ChatTableView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

/**
 *  根据自己发的内容取得自动回复的内容
 *
 *  @param text 自己发的内容
 */
- (NSString *)replayWithText:(NSString *)text
{
    for (int i = 0; i<text.length; i++) {
        NSString *word = [text substringWithRange:NSMakeRange(i, 1)];
        
        if (self.autoreply[word])
        return self.autoreply[word];
    }
    
    return @"滚蛋";
}




-(void)soundBtnOnclick:(UIButton *)Btn{
    NSLog(@"soundBtnOnclick");
}
-(void)faceBtnOnclick:(UIButton *)Btn{
    NSLog(@"faceBtnOnclick");
}
-(void)photoBtnOnclick:(UIButton *)Btn{
    NSLog(@"photoBtnOnclick");
}
@end
