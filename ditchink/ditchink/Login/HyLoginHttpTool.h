//
//  HyLoginHttpTool.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HyLoginParam.h"
#import "HyLoginResult.h"
#import "HySignParam.h"
#import "HySignResult.h"
#import "HyForgetPasswordParam.h"
#import "HyForgetPasswordResult.h"


@interface HyLoginHttpTool : NSObject

+(void)postForLoginWithParameter:(HyLoginParam *)param success:(void (^)(HyLoginResult *result))success failure:(void (^)(NSError *error))failure;

+(void)postForSignWithParameter:(HySignParam *)param  success:(void (^)(HySignResult *result))success failure:(void (^)(NSError *error))failure;

+(void)postForForgotPwdWithParameter:(HyForgetPasswordParam *)param success:(void (^)(HyForgetPasswordResult *result))success failure:(void (^)(NSError *error))failure;


@end
