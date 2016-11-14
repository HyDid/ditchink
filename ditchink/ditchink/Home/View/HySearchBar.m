//
//  HySearchBar.m
//  ditchink
//
//  Created by LiHongYu on 2016/10/16.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySearchBar.h"

@implementation HySearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入您要搜索的内容";
        [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [self setValue:[UIFont boldSystemFontOfSize:11] forKeyPath:@"_placeholderLabel.font"];
        
        self.background = [UIImage imageNamed:@"icon-searchbackground"];
        
        // 通过init初始化的控件大多都没有尺寸
        UIImageView *searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        searchIcon.image = [UIImage imageNamed:@"icon-search"];
        searchIcon.contentMode = UIViewContentModeCenter;

        self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightView = searchIcon;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
    return self;
}



+(instancetype)searchBar
{
    return [[self alloc] init];
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGFloat w = 120;
    CGFloat x = (self.bounds.size.width-w)/2;
    CGFloat y = 4;
    CGFloat h = 30;
    return CGRectMake(x, y, w, h);
}



@end
