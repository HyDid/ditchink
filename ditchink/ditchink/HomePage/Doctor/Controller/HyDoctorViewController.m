//
//  HyDoctorViewController.m
//  ditchink
//
//  Created by LiHongYu on 2017/5/24.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import "HyDoctorViewController.h"

@interface HyDoctorViewController ()

@end

@implementation HyDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD showErrorWithStatus:@"暂未开放"];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(abc) userInfo:nil repeats:NO];
}
-(void)abc{
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
