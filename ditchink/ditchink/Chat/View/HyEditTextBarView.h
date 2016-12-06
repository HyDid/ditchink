//
//  HyEditTextBarView.h
//  ditchink
//
//  Created by LiHongYu on 2016/12/6.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HyEditTextBarView.h"
@protocol HyEditTextBarViewDelegate <NSObject>
@optional
-(void)textFieldReturn:(UITextField *)textField;
-(void)soundBtnOnclick:(UIButton *)Btn;
-(void)faceBtnOnclick:(UIButton *)Btn;
-(void)photoBtnOnclick:(UIButton *)Btn;
@end
@interface HyEditTextBarView : UIView
@property(nonatomic,weak)id <HyEditTextBarViewDelegate> delegate;
@end
