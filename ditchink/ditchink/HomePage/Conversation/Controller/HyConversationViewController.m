//
//  HyConversationViewController.m
//  ditchink
//
//  Created by LiHongYu on 2017/5/24.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import "HyConversationViewController.h"
#import "HyConverView.h"
#import "HyConver.h"

@interface HyConversationViewController ()

@property (nonatomic, copy) NSArray *Convers;

@end

@implementation HyConversationViewController

static int totalColumns = 2;

-(NSArray *)Convers
{
    if (_Convers == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"conver.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *Convers = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HyConver *conver = [HyConver ConverWithDict:dict];
            [Convers addObject:conver];
        }
        _Convers = Convers;
    }
    return _Convers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HyColor(239, 239, 239);
    
    CGFloat ConverW = 120;
    CGFloat ConverH = 220;
    CGFloat marginX = (SCREEN_WIDTH - totalColumns * ConverW) / (totalColumns + 1);
    CGFloat marginY = -30;
    
    for (int index = 0; index<self.Convers.count; index++) {
        
        HyConverView *aView = [HyConverView ConverViewWithView:self.Convers[index]];
        
        
        int row = index / totalColumns;
        int col = index % totalColumns;
        
        CGFloat appX = marginX + col * (ConverW + marginX);
        CGFloat appY = 30 + row * (ConverH + marginY);
        aView.frame = CGRectMake(appX, appY, ConverW, ConverH);
        
        [self.view addSubview:aView];
    }
    
    
    
}





@end
