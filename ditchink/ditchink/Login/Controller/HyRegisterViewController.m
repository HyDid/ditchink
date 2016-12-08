//
//  HyRegisterViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/8.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyRegisterViewController.h"


@interface HyRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation HyRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.registerBtn addTarget:self action:@selector(registerBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    }

-(void)registerBtnOnclick:(UIButton *)registerBtn{
    NSString *strCid = self.nameTextField.text;
    NSString *strPwd = self.passwordTextField.text;
    
    NSLog( @"login - %@|%@", strCid, strPwd);
    
    
    [g_pIMMyself setCustomUserID:strCid];
    [g_pIMMyself setPassword:strPwd];
    [g_pIMMyself registerWithTimeoutInterval:0 success:^{
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(NSString *e) {
        NSLog(@"%@", e);
        
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"注册失败 - %@",e]];
        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"注册失败 - %@", e] message:e delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
//        
//        [alertView show];
    }];

}



@end
