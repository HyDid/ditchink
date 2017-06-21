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
@property (weak, nonatomic) IBOutlet UIButton *back;

@end

@implementation HyRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.registerBtn addTarget:self action:@selector(registerBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.back addTarget:self action:@selector(backBtnOnclick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backBtnOnclick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)registerBtnOnclick:(UIButton *)registerBtn{
    NSString *strCid = self.nameTextField.text;
    NSString *strPwd = self.passwordTextField.text;
    
    NSLog( @"login - %@|%@", strCid, strPwd);
    
    [[EMClient sharedClient]registerWithUsername:strCid password:strPwd completion:^(NSString *aUsername, EMError *aError) {
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"欢迎注册 - %@",aUsername]];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];
    
    
    
//    [g_pIMMyself setCustomUserID:strCid];
//    [g_pIMMyself setPassword:strPwd];
//    [g_pIMMyself registerWithTimeoutInterval:0 success:^{
//        
//        [self backBtnOnclick];
//        
//    } failure:^(NSString *e) {
//        NSLog(@"%@", e);
//        
//        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"注册失败 - %@",e]];
//        
////        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"注册失败 - %@", e] message:e delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
////        
////        [alertView show];
//    }];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.nameTextField resignFirstResponder];
    
    [self.passwordTextField resignFirstResponder];
}

@end
