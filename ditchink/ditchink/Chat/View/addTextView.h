//
//  addTextView.h
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addTextView.h"
@protocol addTextViewDelegate <NSObject>
@optional
-(void)EditTextView:(UITextField *)textField;
-(void)soundBtnOnclick:(UIButton *)Btn;

@end
@interface addTextView : UIView<UITextFieldDelegate>

@property(nonatomic,weak)id <addTextViewDelegate> delegate;
@end
