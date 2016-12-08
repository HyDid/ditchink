//
//  HyLoginHttpTool.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyLoginHttpTool.h"
#import "HyHttpTool.h"
#import "MJExtension.h"

@implementation HyLoginHttpTool

//登录
+(void)postForLoginWithParameter:(HyLoginParam *)param success:(void (^)(HyLoginResult *result))success failure:(void (^)(NSError *error))failure{
    
        NSString *postURL = [NSString stringWithFormat:@"http://localhost:8080/iCCUT/servlet/join"];
        [HyHttpTool postWithURL:postURL parameter:param.mj_keyValues success:^(id json) {
            HyLoginResult *result = [HyLoginResult mj_objectWithKeyValues:json];
            if(success){
                success(result);
                
            }
        } failure:^(NSError *error) {
            if(failure){
                failure(error);
            }
        }];
}

//注册
+(void)postForSignWithParameter:(HySignParam *)param  success:(void (^)(HySignResult *result))success failure:(void (^)(NSError *error))failure{
    
    NSString *postURL = @"http://localhost:8080/abc/form";
    
    [HyHttpTool postWithURL:postURL parameter:param.mj_keyValues success:^(id json) {
        HySignResult *result = [HySignResult mj_objectWithKeyValues:json];
        if(success){
            success(result);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
    
}

//忘记密码
+(void)postForForgotPwdWithParameter:(HyForgetPasswordParam *)param success:(void (^)(HyForgetPasswordResult *result))success failure:(void (^)(NSError *error))failure{
    
}



@end
