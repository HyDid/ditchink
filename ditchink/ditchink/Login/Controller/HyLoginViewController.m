//
//  HyLoginViewController.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/8.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyLoginViewController.h"
#import "HyRegisterViewController.h"



@interface HyLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;

@end

@implementation HyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    //设置导航栏
    [self setupNav];
    [self.registerBtn addTarget:self action:@selector(registerBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.LoginBtn addTarget:self action:@selector(LoginBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.logoutBtn addTarget:self action:@selector(logoutBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setupNav{
   // [self.navigationController.navigationBar setHidden:YES];
}

-(void)registerBtnOnclick:(UIButton *)registerBtn{
    HyRegisterViewController *RegisterViewController = [[HyRegisterViewController alloc]init];
    [self.navigationController pushViewController:RegisterViewController animated:YES];
}
-(void)LoginBtnOnclick:(UIButton *)LoginBtn{
    NSString *strCid = [_nameTextField text];
    NSString *strPwd = [_passwordTextField text];
    
    NSLog( @"login - %@|%@", strCid, strPwd);
    
    
    [g_pIMMyself setCustomUserID:[_nameTextField text]];
    [g_pIMMyself setPassword:[_passwordTextField text]];
    [g_pIMMyself loginWithTimeoutInterval:0 success:^{
        
        [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(NSString *e) {
        NSLog(@"%@", e);
        
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"登录失败 - %@",e]];
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"注册失败 - %@", e] message:e delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
//        
//        [alertView show];
    }];
}

-(void)logoutBtnOnclick:(UIButton *)logoutBtn{
    [g_pIMMyself logout];
}

@end
