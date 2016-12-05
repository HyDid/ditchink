//
//  addTextView.m
//  ditchink
//
//  Created by LiHongYu on 2016/12/5.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "addTextView.h"

@interface addTextView()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *soundBtn;
@property (weak, nonatomic) IBOutlet UIButton *faceBtn;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
@implementation addTextView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"addTextView"  owner:self options:nil] lastObject];
        
        [self addSubview:view];
        
    }
    return self;
}
-(void)layoutSubviews{
    self.textField.delegate = self;
    self.textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.textField.leftViewMode = UITextFieldViewModeAlways;
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
    
    NSLog(@"%@",textField.text);
    
    if ([self.delegate respondsToSelector:@selector(EditTextView:)]) {
        [self.delegate EditTextView:textField];
        NSLog(@"%@",textField.text);
    }
    
    
    [self endEditing:YES];
    //清空文字
    self.textField.text = nil;
    
    
    // 返回YES即可
    return YES;
}
- (IBAction)soundsound:(id)sender {
    if ([self.delegate respondsToSelector:@selector(soundBtnOnclick:)]) {
        [self.delegate soundBtnOnclick:sender];

    }
}


@end
