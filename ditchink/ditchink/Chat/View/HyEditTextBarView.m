//
//  HyEditTextBarView.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/6.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyEditTextBarView.h"

@interface HyEditTextBarView()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *btn;
@property (weak, nonatomic) IBOutlet UIButton *soundBtn;
@property (weak, nonatomic) IBOutlet UIButton *faceBtn;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;

@end
@implementation HyEditTextBarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"HyEditTextBarView"  owner:self options:nil] lastObject];
        
        [self addSubview:view];
    }
    return self;
}

-(void)layoutSubviews{

    self.editTextField.delegate = self;
    self.editTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.editTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.soundBtn addTarget:self action:@selector(soundOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.faceBtn addTarget:self action:@selector(faceOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.photoBtn addTarget:self action:@selector(photoOnclick:) forControlEvents:UIControlEventTouchUpInside];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    //    // 设置窗口的颜色
    //    self.superview.window.backgroundColor = self.editTextView.backgroundColor;
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = (keyboardFrame.origin.y - SCREEN_HEIGHT);
    
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.superview.transform = CGAffineTransformMakeTranslation(0, transformY/2);
    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if ([self.delegate respondsToSelector:@selector(textFieldReturn:)]) {
        [self.delegate textFieldReturn:textField];
    }
    
    [self endEditing:YES];

    self.editTextField.text = nil;
    
    
    return YES;
}







-(void)soundOnclick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(soundBtnOnclick:)]) {
        [self.delegate soundBtnOnclick:btn];
    }
}
-(void)faceOnclick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(faceBtnOnclick:)]) {
        [self.delegate faceBtnOnclick:btn];
    }
}
-(void)photoOnclick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(photoBtnOnclick:)]) {
        [self.delegate photoBtnOnclick:btn];
    }
}

@end
